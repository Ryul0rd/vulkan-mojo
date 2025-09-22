import xmb as xmb # will replace xmb with something public soonish
import vk
import time
from sys import size_of
from math import clamp
from memory import UnsafePointer


alias Ptr = UnsafePointer


fn main() raises:
    xconn = xmb.Connection()
    roots_iter = xconn.setup_roots_iterator()
    screen = roots_iter.__next__()
    atoms = xmb.AtomCollection["WM_PROTOCOLS", "WM_DELETE_WINDOW"](xconn)

    alias SCREEN_WIDTH = 800
    alias SCREEN_HEIGHT = 600
    window = xmb.Window(xconn)
    create_window_cookie = xconn.create_window(
        window,
        screen[].root,
        SCREEN_WIDTH, SCREEN_HEIGHT,
        screen[].root_visual,
        xmb.EventMask(
            xmb.EventMask.EXPOSURE,
            xmb.EventMask.KEY_PRESS,
            xmb.EventMask.BUTTON_PRESS,
            xmb.EventMask.POINTER_MOTION,
        ),
        background_pixel = screen[].black_pixel,
    )
    set_title_cookie = xconn.set_window_title(window, "Vulkan Test")
    subscribe_wm_delete_window_cookie = xconn.set_wm_delete_window(window, atoms.WM_PROTOCOLS, atoms.WM_DELETE_WINDOW)
    size_hints = xmb.SizeHints()
    size_hints.set_fixed_size(SCREEN_WIDTH, SCREEN_HEIGHT)
    set_window_size_cookie = xconn.set_wm_normal_hints(window, size_hints)
    map_window_cookie = xconn.map_window(window)
    gc = xmb.GContext(xconn)
    create_gc_cookie = xconn.create_gc(gc, window, graphics_exposures=False)

    xconn.request_check(create_window_cookie)
    xconn.request_check(set_title_cookie)
    xconn.request_check(subscribe_wm_delete_window_cookie)
    xconn.request_check(set_window_size_cookie)
    xconn.request_check(map_window_cookie)
    xconn.request_check(create_gc_cookie)

    # vulkan stuff starts here
    var vkg = vk.GlobalFunctionsV1_3()
    var version = vk.zero_init[vk.Version]()
    _ = vkg.enumerate_instance_version(version)
    print("Version:", version)

    var required_layers = List[StaticString]("VK_LAYER_KHRONOS_validation")
    var layer_properties_result = vkg.enumerate_instance_layer_properties()
    var layer_properties = layer_properties_result.steal_list()
    for required_layer in required_layers:
        layer_found = any([lp.layer_name_slice() == required_layer for lp in layer_properties])
        if not layer_found:
            raise "Layer " + String(required_layer) + " not found"

    var required_instance_extensions = List[StaticString]("VK_KHR_surface", "VK_KHR_xcb_surface")
    var extension_properties_result = vkg.enumerate_instance_extension_properties(Ptr[UInt8]())
    var extension_properties = extension_properties_result.steal_list()
    for required_extension in required_instance_extensions:
        extension_found = any([ep.extension_name_slice() == required_extension for ep in extension_properties])
        if not extension_found:
            raise "Extension " + String(required_extension) + " not found"

    # Instance Creation
    var app_info = vk.ApplicationInfo(
        p_application_name = "Hello Triangle".unsafe_ptr(),
        application_version = vk.Version(1, 0, 0),
        p_engine_name = "No Engine".unsafe_ptr(),
        engine_version = vk.Version(1, 0, 0),
        api_version = vk.Version(1, 3, 0),
    )
    var enabled_layer_names = [rl.unsafe_ptr() for rl in required_layers]
    var enabled_extension_names = [re.unsafe_ptr() for re in required_instance_extensions]
    var instance_create_info = vk.InstanceCreateInfo(
        p_application_info = Ptr(to=app_info),
        enabled_layer_count = len(required_layers),
        pp_enabled_layer_names = enabled_layer_names.unsafe_ptr().bitcast[Ptr[UInt8]](), # so dumb
        enabled_extension_count = len(required_instance_extensions),
        pp_enabled_extension_names = enabled_extension_names.unsafe_ptr().bitcast[Ptr[UInt8]](),
    )
    var instance = vk.Instance.NULL
    var result = vkg.create_instance(instance_create_info, Ptr[vk.AllocationCallbacks](), instance)
    _ = app_info
    _ = enabled_layer_names
    _ = enabled_extension_names
    if result.is_error():
        raise String(result)
    var vki = vk.InstanceFunctionsV1_3(vkg, instance)

    # Surface Creation
    var khr_surface = vk.khr.Surface(vkg, instance)
    var xcb_surface = vk.khr.XcbSurface(vkg, instance)
    var surface_create_info = vk.XcbSurfaceCreateInfoKHR(
        connection = xconn._connection.bitcast[vk.xcb_connection_t](),
        window = Ptr(to=window.id()).bitcast[vk.xcb_window_t]()[],
    )
    var surface = vk.SurfaceKHR.NULL
    result = xcb_surface.create_xcb_surface_khr(instance, surface_create_info, Ptr[vk.AllocationCallbacks](), surface)
    if result.is_error():
        raise String(result)

    # Select Physical Device
    var physical_devices_result = vki.enumerate_physical_devices(instance)
    var physical_devices = physical_devices_result.steal_list()
    if len(physical_devices) == 0:
        raise "No physical devices found"
    print("Found", len(physical_devices), "physical devices")

    var required_device_extensions = List[StaticString]("VK_KHR_swapchain")
    var maybe_physical_device_index = Optional[UInt32]()
    var maybe_queue_family_index = Optional[UInt32]()
    var maybe_surface_capabilities = Optional[vk.SurfaceCapabilitiesKHR]()
    var maybe_formats = Optional[List[vk.SurfaceFormatKHR]]()
    var maybe_present_modes = Optional[List[vk.PresentModeKHR]]()
    for device_index, physical_device in enumerate(physical_devices):
        # check if all extensions are supported
        var available_extensions_result = vki.enumerate_device_extension_properties(physical_device, Ptr[UInt8]())
        var available_extensions = available_extensions_result.steal_list()
        # we convert to strings here instead of using string slices because borrow checker angry :(
        var available_extension_names = [String(ae.extension_name_slice()) for ae in available_extensions]
        var extensions_supported = all([rde in available_extension_names for rde in required_device_extensions])
        if not extensions_supported:
            continue
        
        # check is swapchain is sufficient
        var formats_result = khr_surface.get_physical_device_surface_formats_khr(physical_device, surface)
        var formats = formats_result.steal_list()
        if len(formats) == 0:
            continue
        var present_modes_result = khr_surface.get_physical_device_surface_present_modes_khr(physical_device, surface)
        var present_modes = present_modes_result.steal_list()
        if len(present_modes) == 0:
            continue
        var surface_capabilities = vk.SurfaceCapabilitiesKHR()
        _ = khr_surface.get_physical_device_surface_capabilities_khr(physical_device, surface, surface_capabilities)

        # look for suitable queue family index
        var queue_families = vki.get_physical_device_queue_family_properties(physical_device)
        for queue_family_index, queue_family in enumerate(queue_families):
            var graphics_supported = vk.QueueFlags.GRAPHICS in queue_family.queue_flags
            var present_supported: vk.Bool32 = False
            _ = khr_surface.get_physical_device_surface_support_khr(physical_device, queue_family_index, surface, present_supported)
            if graphics_supported and present_supported:
                maybe_physical_device_index = UInt32(device_index)
                maybe_queue_family_index = UInt32(queue_family_index)
                maybe_surface_capabilities = surface_capabilities
                maybe_formats = formats^
                maybe_present_modes = present_modes^
                break
        if maybe_physical_device_index:
            break
    
    if not maybe_physical_device_index:
        raise "No suitable physical device found"
    var physical_device_index = maybe_physical_device_index.take()
    var queue_family_index = maybe_queue_family_index.take()
    var surface_capabilities = maybe_surface_capabilities.take()
    var supported_formats = maybe_formats.take()
    var present_modes = maybe_present_modes.take()
    var physical_device = physical_devices[physical_device_index]
    print("Using Physical Device:", physical_device_index)
    print("Using Queue Family Index:", queue_family_index)

    # Create Logical Device + Get Device's Queues
    var queue_priorities = InlineArray[Float32, 1](1.0)
    var queue_create_info = vk.DeviceQueueCreateInfo(
        queue_family_index = queue_family_index,
        queue_count = len(queue_priorities),
        p_queue_priorities = queue_priorities.unsafe_ptr(),
    )
    var device_features = vk.PhysicalDeviceFeatures() 
    var device_create_info = vk.DeviceCreateInfo(
        p_queue_create_infos = Ptr(to=queue_create_info),
        queue_create_info_count = 1,
        p_enabled_features = Ptr(to=device_features),
        enabled_extension_count = len(required_device_extensions),
        pp_enabled_extension_names = [rde.unsafe_ptr() for rde in required_device_extensions].unsafe_ptr().bitcast[Ptr[UInt8]](),
    )
    var device = vk.Device.NULL
    result = vki.create_device(physical_device, device_create_info, Ptr[vk.AllocationCallbacks](), device)
    _ = queue_priorities
    _ = queue_create_info
    _ = device_features
    if result.is_error():
        raise String(result)
    var vkd = vk.DeviceFunctionsV1_3(vkg, device)

    var queue = vk.Queue.NULL
    vkd.get_device_queue(device, queue_family_index, 0, queue)

    # Swapchain
    var format = supported_formats[0]
    for supported_format in supported_formats:
        if supported_format.format == vk.Format.B8G8R8A8_SRGB and supported_format.color_space == vk.ColorSpaceKHR.SRGB_NONLINEAR_KHR:
            format = supported_format
            break
    var present_mode = vk.PresentModeKHR.FIFO_KHR
    if vk.PresentModeKHR.MAILBOX_KHR in present_modes:
        present_mode = vk.PresentModeKHR.MAILBOX_KHR
    var extent = surface_capabilities.current_extent
    if surface_capabilities.current_extent.width == UInt32.MAX:
        extent = vk.Extent2D(SCREEN_WIDTH, SCREEN_HEIGHT)
    var image_count = surface_capabilities.min_image_count + 1
    if surface_capabilities.max_image_count > 0:
        image_count = min(image_count, surface_capabilities.max_image_count)
    var swapchain_create_info = vk.SwapchainCreateInfoKHR(
        surface = surface,
        min_image_count = image_count,
        image_format = format.format,
        image_color_space = format.color_space,
        image_extent = extent,
        image_array_layers = 1,
        image_usage = vk.ImageUsageFlags.COLOR_ATTACHMENT,
        image_sharing_mode = vk.SharingMode.EXCLUSIVE,
        pre_transform = surface_capabilities.current_transform,
        composite_alpha = vk.CompositeAlphaFlagsKHR.OPAQUE_KHR,
        present_mode = present_mode,
        clipped = True,
        old_swapchain = vk.SwapchainKHR.NULL,
    )
    khr_swapchain = vk.khr.Swapchain(vkg, device)
    var swapchain = vk.SwapchainKHR.NULL
    result = khr_swapchain.create_swapchain_khr(device, swapchain_create_info, Ptr[vk.AllocationCallbacks](), swapchain)
    if result.is_error():
        raise String(result)
    var swapchain_images_result = khr_swapchain.get_swapchain_images_khr(device, swapchain)
    var swapchain_images = swapchain_images_result.steal_list()

    # Image Views
    var swapchain_image_views = List[vk.ImageView](unsafe_uninit_length=len(swapchain_images))
    for i, image in enumerate(swapchain_images):
        var image_view_create_info = vk.ImageViewCreateInfo(
            image = image,
            view_type = vk.ImageViewType.N_2D,
            format = format.format,
            components = vk.ComponentMapping(
                vk.ComponentSwizzle.IDENTITY,
                vk.ComponentSwizzle.IDENTITY,
                vk.ComponentSwizzle.IDENTITY,
                vk.ComponentSwizzle.IDENTITY,
            ),
            subresource_range = vk.ImageSubresourceRange(
                aspect_mask = vk.ImageAspectFlags.COLOR,
                base_mip_level = 0,
                level_count = 1,
                base_array_layer = 0,
                layer_count = 1,
            ),
        )
        result = vkd.create_image_view(device, image_view_create_info, Ptr[vk.AllocationCallbacks](), swapchain_image_views[i])
        if result.is_error():
            raise String(result)
    
    # Loading Shaders
    var vert_shader_bytes: List[Byte]
    with open("triangle.vert.spv", "r") as f:
        vert_shader_bytes = f.read_bytes()
    var vert_shader_create_info = vk.ShaderModuleCreateInfo(
        code_size = len(vert_shader_bytes),
        p_code = vert_shader_bytes.unsafe_ptr().bitcast[UInt32](),
    )
    var vert_shader_module = vk.ShaderModule.NULL
    _ = vkd.create_shader_module(device, vert_shader_create_info, Ptr[vk.AllocationCallbacks](), vert_shader_module)
    _ = vert_shader_bytes

    var frag_shader_bytes: List[Byte]
    with open("triangle.frag.spv", "r") as f:
        frag_shader_bytes = f.read_bytes()
    var frag_shader_create_info = vk.ShaderModuleCreateInfo(
        code_size = len(frag_shader_bytes),
        p_code = frag_shader_bytes.unsafe_ptr().bitcast[UInt32](),
    )
    var frag_shader_module = vk.ShaderModule.NULL
    _ = vkd.create_shader_module(device, frag_shader_create_info, Ptr[vk.AllocationCallbacks](), frag_shader_module)
    _ = frag_shader_bytes

    # Shader Stage Creation
    var vert_shader_stage_info = vk.PipelineShaderStageCreateInfo(
        stage = vk.ShaderStageFlags.VERTEX,
        module = vert_shader_module,
        p_name = "main".unsafe_ptr(),
    )
    var frag_shader_stage_info = vk.PipelineShaderStageCreateInfo(
        stage = vk.ShaderStageFlags.FRAGMENT,
        module = frag_shader_module,
        p_name = "main".unsafe_ptr(),
    )
    var shader_stages = InlineArray[size=2](vert_shader_stage_info, frag_shader_stage_info)

    # Pipeline
    var dynamic_states = InlineArray[size=2](vk.DynamicState.VIEWPORT, vk.DynamicState.SCISSOR)
    var dynamic_state_create_info = vk.PipelineDynamicStateCreateInfo(
        dynamic_state_count = len(dynamic_states),
        p_dynamic_states = dynamic_states.unsafe_ptr(),
    )
    var vertex_input_create_info = vk.PipelineVertexInputStateCreateInfo(
        vertex_binding_description_count = 0,
        vertex_attribute_description_count = 0,
    )
    var input_assembly_create_info = vk.PipelineInputAssemblyStateCreateInfo(
        topology = vk.PrimitiveTopology.TRIANGLE_LIST,
        primitive_restart_enable = False,
    )
    var viewport = vk.Viewport(
        x = 0, y = 0,
        width = Float32(extent.width), height = Float32(extent.height),
        min_depth = 0, max_depth = 1,
    )
    var scissor = vk.Rect2D(vk.Offset2D(0, 0), extent)
    var viewport_state = vk.PipelineViewportStateCreateInfo(
        viewport_count = 1,
        p_viewports = Ptr(to=viewport),
        scissor_count = 1,
        p_scissors = Ptr(to=scissor),
    )
    var rasterizer = vk.PipelineRasterizationStateCreateInfo(
        depth_clamp_enable = False,
        rasterizer_discard_enable = False,
        polygon_mode = vk.PolygonMode.FILL,
        line_width = 1,
        cull_mode = vk.CullModeFlags.BACK,
        front_face = vk.FrontFace.CLOCKWISE,
        depth_bias_enable = False,
        depth_bias_constant_factor = 0,
        depth_bias_clamp = 0,
        depth_bias_slope_factor = 0,
    )
    var multisampling = vk.PipelineMultisampleStateCreateInfo(
        sample_shading_enable = False,
        rasterization_samples = vk.SampleCountFlags.N_1,
        min_sample_shading = 1,
    )
    var color_blend_attachment = vk.PipelineColorBlendAttachmentState(
        color_write_mask = (
            vk.ColorComponentFlags.R
            | vk.ColorComponentFlags.G
            | vk.ColorComponentFlags.B
            | vk.ColorComponentFlags.A
        ),
        blend_enable = False,
        src_color_blend_factor = vk.BlendFactor.ONE,
        dst_color_blend_factor = vk.BlendFactor.ZERO,
        color_blend_op = vk.BlendOp.ADD,
        src_alpha_blend_factor = vk.BlendFactor.ONE,
        dst_alpha_blend_factor = vk.BlendFactor.ZERO,
        alpha_blend_op = vk.BlendOp.ADD,
    )
    var color_blend_create_info = vk.PipelineColorBlendStateCreateInfo(
        logic_op_enable = False,
        logic_op = vk.LogicOp.COPY,
        attachment_count = 1,
        p_attachments = Ptr(to=color_blend_attachment),
        blend_constants = InlineArray[Float32, 4](0, 0, 0, 0)
    )
    var pipeline_layout_create_info = vk.PipelineLayoutCreateInfo()
    var pipeline_layout = vk.PipelineLayout.NULL
    result = vkd.create_pipeline_layout(device, pipeline_layout_create_info, Ptr[vk.AllocationCallbacks](), pipeline_layout)
    if result.is_error():
        raise String(result)
    _ = dynamic_states
    _ = viewport
    _ = scissor
    _ = color_blend_attachment

    # Attachment Description
    var color_attachment = vk.AttachmentDescription(
        format = format.format,
        samples = vk.SampleCountFlags.N_1,
        load_op = vk.AttachmentLoadOp.CLEAR,
        store_op = vk.AttachmentStoreOp.STORE,
        stencil_load_op = vk.AttachmentLoadOp.DONT_CARE,
        stencil_store_op = vk.AttachmentStoreOp.DONT_CARE,
        initial_layout = vk.ImageLayout.UNDEFINED,
        final_layout = vk.ImageLayout.PRESENT_SRC_KHR,
    )
    var color_attachment_reference = vk.AttachmentReference(
        attachment = 0,
        layout = vk.ImageLayout.COLOR_ATTACHMENT_OPTIMAL,
    )
    var subpass = vk.SubpassDescription(
        pipeline_bind_point = vk.PipelineBindPoint.GRAPHICS,
        color_attachment_count = 1,
        p_color_attachments = Ptr(to=color_attachment_reference),
    )
    var subpass_dependency = vk.SubpassDependency(
        src_subpass = vk.SUBPASS_EXTERNAL,
        dst_subpass = 0,
        src_stage_mask = vk.PipelineStageFlags.COLOR_ATTACHMENT_OUTPUT,
        src_access_mask = vk.AccessFlags(),
        dst_stage_mask = vk.PipelineStageFlags.COLOR_ATTACHMENT_OUTPUT,
        dst_access_mask = vk.AccessFlags.COLOR_ATTACHMENT_WRITE,
    )
    var render_pass_create_info = vk.RenderPassCreateInfo(
        attachment_count = 1,
        p_attachments = Ptr(to=color_attachment),
        subpass_count = 1,
        p_subpasses = Ptr(to=subpass),
        dependency_count = 1,
        p_dependencies = Ptr(to=subpass_dependency),
    )
    var render_pass = vk.RenderPass.NULL
    result = vkd.create_render_pass(device, render_pass_create_info, Ptr[vk.AllocationCallbacks](), render_pass)
    if result.is_error():
        raise String(result)
    _ = color_attachment
    _ = color_attachment_reference
    _ = subpass
    _ = subpass_dependency

    # Graphics Pipeline
    var graphics_pipeline_create_info = vk.GraphicsPipelineCreateInfo(
        stage_count = len(shader_stages),
        p_stages = shader_stages.unsafe_ptr(),
        p_vertex_input_state = Ptr(to=vertex_input_create_info),
        p_input_assembly_state = Ptr(to=input_assembly_create_info),
        p_viewport_state = Ptr(to=viewport_state),
        p_rasterization_state = Ptr(to=rasterizer),
        p_multisample_state = Ptr(to=multisampling),
        p_color_blend_state = Ptr(to=color_blend_create_info),
        p_dynamic_state = Ptr(to=dynamic_state_create_info),
        layout = pipeline_layout,
        render_pass = render_pass,
        subpass = 0,
        base_pipeline_handle = vk.Pipeline.NULL,
        base_pipeline_index = -1,
    )
    var graphics_pipeline = vk.Pipeline.NULL
    result = vkd.create_graphics_pipelines(
        device,
        vk.PipelineCache.NULL,
        1,
        Ptr(to=graphics_pipeline_create_info),
        Ptr[vk.AllocationCallbacks](),
        Ptr(to=graphics_pipeline),
    )
    if result.is_error():
        raise String(result)
    _ = shader_stages
    _ = vertex_input_create_info
    _ = input_assembly_create_info
    _ = viewport_state
    _ = rasterizer
    _ = multisampling
    _ = color_blend_create_info
    _ = dynamic_state_create_info

    # Fremebuffers
    var swapchain_framebuffers = List[vk.Framebuffer](unsafe_uninit_length=len(swapchain_image_views))
    #for image_view, framebuffer in zip(swapchain_image_views, swapchain_framebuffers): # one day
    for i in range(len(swapchain_image_views)):
        var framebuffer_create_info = vk.FramebufferCreateInfo(
            render_pass = render_pass,
            attachment_count = 1,
            p_attachments = Ptr(to=swapchain_image_views[i]),
            width = extent.width,
            height = extent.height,
            layers = 1,
        )
        result = vkd.create_framebuffer(device, framebuffer_create_info, Ptr[vk.AllocationCallbacks](), swapchain_framebuffers[i])
        if result.is_error():
            raise String(result)

    # Command Pool
    var command_pool_create_info = vk.CommandPoolCreateInfo(
        flags = vk.CommandPoolCreateFlags.RESET_COMMAND_BUFFER,
        queue_family_index = queue_family_index,
    )
    var command_pool = vk.CommandPool.NULL
    result = vkd.create_command_pool(device, command_pool_create_info, Ptr[vk.AllocationCallbacks](), command_pool)
    if result.is_error():
        raise String(result)

    # Command Buffer Allocation
    var command_buffer_allocate_info = vk.CommandBufferAllocateInfo(
        command_pool = command_pool,
        level = vk.CommandBufferLevel.PRIMARY,
        command_buffer_count = 1,
    )
    var command_buffer = vk.CommandBuffer.NULL
    result = vkd.allocate_command_buffers(device, command_buffer_allocate_info, Ptr(to=command_buffer))

    # Create Sync Objects
    var semaphore_create_info = vk.SemaphoreCreateInfo()
    var image_available_semaphore = vk.Semaphore.NULL
    var render_finished_semaphore = vk.Semaphore.NULL
    result = vkd.create_semaphore(device, semaphore_create_info, Ptr[vk.AllocationCallbacks](), image_available_semaphore)
    if result.is_error():
        raise String(result)
    result = vkd.create_semaphore(device, semaphore_create_info, Ptr[vk.AllocationCallbacks](), render_finished_semaphore)
    if result.is_error():
        raise String(result)

    var fence_create_info = vk.FenceCreateInfo(flags=vk.FenceCreateFlags.SIGNALED)
    var inflight_fence = vk.Fence.NULL
    result = vkd.create_fence(device, fence_create_info, Ptr[vk.AllocationCallbacks](), inflight_fence)
    if result.is_error():
        raise String(result)

    # MAIN FUCKING LOOP
    alias TARGET_FPS = 60
    alias TARGET_FRAME_DURATION = 1 / TARGET_FPS
    alias NANOSECONDS_PER_SECOND = 1e9
    alias SECONDS_PER_NANOSECOND = 1 / NANOSECONDS_PER_SECOND
    var done = False
    while not done:
        var frame_start_time = time.monotonic()
        for event in xconn.events():
            if event[].isa[xmb.KeyPressEvent]():
                print("Pressed key", event[].asa[xmb.KeyPressEvent]().key.value())
            elif event[].isa[xmb.ButtonPressEvent]():
                print("Pressed button", String(event[].asa[xmb.ButtonPressEvent]().button))
            elif event[].isa[xmb.MotionNotifyEvent]():
                print("Moved mouse", event[].asa[xmb.MotionNotifyEvent]().detail)
            elif event[].isa[xmb.ClientMessageEvent]():
                var cmevent = event[].asa[xmb.ClientMessageEvent]().copy()
                if cmevent.is_delete_window_message(atoms.WM_PROTOCOLS, atoms.WM_DELETE_WINDOW):
                    print("Got a quit message")
                    done = True
        draw_frame(
            vkd, khr_swapchain,
            device, swapchain,
            inflight_fence, image_available_semaphore, render_finished_semaphore,
            command_buffer, queue, render_pass,
            swapchain_framebuffers, extent, graphics_pipeline,
        )
        var elapsed_time = Float64(time.monotonic() - frame_start_time) * SECONDS_PER_NANOSECOND
        if elapsed_time < TARGET_FRAME_DURATION:
            time.sleep(TARGET_FRAME_DURATION - elapsed_time)

    # Vulkan Cleanup
    _ = vkd.device_wait_idle(device)
    vkd.destroy_fence(device, inflight_fence, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_semaphore(device, image_available_semaphore, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_semaphore(device, render_finished_semaphore, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_command_pool(device, command_pool, Ptr[vk.AllocationCallbacks]())
    for framebuffer in swapchain_framebuffers:
        vkd.destroy_framebuffer(device, framebuffer, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_pipeline(device, graphics_pipeline, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_render_pass(device, render_pass, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_pipeline_layout(device, pipeline_layout, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_shader_module(device, frag_shader_module, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_shader_module(device, vert_shader_module, Ptr[vk.AllocationCallbacks]())
    for image_view in swapchain_image_views:
        vkd.destroy_image_view(device, image_view, Ptr[vk.AllocationCallbacks]())
    khr_swapchain.destroy_swapchain_khr(device, swapchain, Ptr[vk.AllocationCallbacks]())
    khr_surface.destroy_surface_khr(instance, surface, Ptr[vk.AllocationCallbacks]())
    vkd.destroy_device(device, Ptr[vk.AllocationCallbacks]())
    vki.destroy_instance(instance, Ptr[vk.AllocationCallbacks]())


fn draw_frame(
    vkd: vk.DeviceFunctionsV1_3,
    khr_swapchain: vk.khr.Swapchain,
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
    inflight_fence: vk.Fence,
    image_available_semaphore: vk.Semaphore,
    render_finished_semaphore: vk.Semaphore,
    command_buffer: vk.CommandBuffer,
    queue: vk.Queue,
    render_pass: vk.RenderPass,
    swapchain_framebuffers: List[vk.Framebuffer],
    extent: vk.Extent2D,
    graphics_pipeline: vk.Pipeline,
) raises:
    # wait for previous frame and acquire image
    _ = vkd.wait_for_fences(device, 1, Ptr(to=inflight_fence), True, UInt64.MAX)
    _ = vkd.reset_fences(device, 1, Ptr(to=inflight_fence))
    var image_indices = InlineArray[UInt32, 1](0)
    _ = khr_swapchain.acquire_next_image_khr(device, swapchain, UInt64.MAX, image_available_semaphore, vk.Fence.NULL, image_indices[0])
    _ = vkd.reset_command_buffer(command_buffer, vk.CommandBufferResetFlags())

    # record command buffer
    var begin_info = vk.CommandBufferBeginInfo()
    var result = vkd.begin_command_buffer(command_buffer, begin_info)
    if result.is_error():
        raise String(result)
    var clear_value = vk.ClearValue(vk.ClearColorValue(InlineArray[Float32, 4](0, 0, 0, 1)))
    var render_pass_info = vk.RenderPassBeginInfo(
        render_pass = render_pass,
        framebuffer = swapchain_framebuffers[image_indices[0]],
        render_area = vk.Rect2D(vk.Offset2D(0, 0), extent),
        clear_value_count = 1,
        p_clear_values = Ptr(to=clear_value),
    )
    vkd.cmd_begin_render_pass(command_buffer, render_pass_info, vk.SubpassContents.INLINE)
    _ = clear_value

    vkd.cmd_bind_pipeline(command_buffer, vk.PipelineBindPoint.GRAPHICS, graphics_pipeline)
    var viewport = vk.Viewport(
        x = 0, y = 0,
        width = Float32(extent.width), height = Float32(extent.height),
        min_depth = 0, max_depth = 1,
    )
    vkd.cmd_set_viewport(command_buffer, 0, 1, Ptr(to=viewport))
    var scissor = vk.Rect2D(vk.Offset2D(0, 0), extent)
    vkd.cmd_set_scissor(command_buffer, 0, 1, Ptr(to=scissor))
    vkd.cmd_draw(command_buffer, 3, 1, 0, 0)

    vkd.cmd_end_render_pass(command_buffer)
    result = vkd.end_command_buffer(command_buffer)
    if result.is_error():
        raise String(result)
    
    # submit command buffer
    var command_buffers = InlineArray[size=1](command_buffer)
    var wait_stages = InlineArray[size=1](vk.PipelineStageFlags.COLOR_ATTACHMENT_OUTPUT)
    var wait_semaphores = InlineArray[size=1](image_available_semaphore)
    var signal_semaphores = InlineArray[size=1](render_finished_semaphore)
    var submit_info = vk.SubmitInfo(
        wait_semaphore_count = len(wait_semaphores),
        p_wait_semaphores = wait_semaphores.unsafe_ptr(),
        p_wait_dst_stage_mask = wait_stages.unsafe_ptr().bitcast[vk.PipelineStageFlags](),
        command_buffer_count = len(command_buffers),
        p_command_buffers = command_buffers.unsafe_ptr(),
        signal_semaphore_count = len(signal_semaphores),
        p_signal_semaphores = signal_semaphores.unsafe_ptr(),
    )
    result = vkd.queue_submit(queue, 1, Ptr(to=submit_info), inflight_fence)
    _ = command_buffers
    _ = wait_stages
    _ = image_available_semaphore
    if result.is_error():
        raise String(result)
    
    # present
    var swapchains = InlineArray[vk.SwapchainKHR, 1](swapchain)
    var present_info = vk.PresentInfoKHR(
        wait_semaphore_count = len(signal_semaphores),
        p_wait_semaphores = signal_semaphores.unsafe_ptr(),
        swapchain_count = len(swapchains),
        p_swapchains = swapchains.unsafe_ptr(),
        p_image_indices = image_indices.unsafe_ptr(),
    )
    _ = khr_swapchain.queue_present_khr(queue, present_info)
    _ = wait_semaphores
    _ = render_finished_semaphore
    _ = swapchains
    _ = image_indices