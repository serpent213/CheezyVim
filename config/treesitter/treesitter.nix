{pkgs, ...}: {
  plugins.treesitter = with pkgs.lib; {
    enable = mkDefault true;
    settings.highlight.enable = mkDefault true;
  };
}
