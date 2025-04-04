{pkgs, ...}: {
  plugins.harpoon = with pkgs.lib; {
    enable = mkDefault true;
    enableTelescope = mkDefault true;
  };
}
