{ pkgs, ... }: {
  packages = with pkgs; [
    pixi
    clang
  ];
}
