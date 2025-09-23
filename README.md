# vulkan-mojo
Generated Mojo bindings for the Vulkan graphics API

## Overview
- Generated from vk.xml
- Unsafe. Use validation layers to catch mistakes
- Note that pointers in structs do not retain origin info so you need to manually make sure they live long enough
- Hpp-style convenience functions for the 2 call pattern
- Linux only currently
- Check examples for usage

## Included Example
Basic Triangle
![Basic Triangle](./images/triangle.png)