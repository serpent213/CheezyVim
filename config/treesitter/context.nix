{pkgs, ...}: {
  plugins.treesitter-context = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      max_lines = 5;
      # multiline_threshold = 20;
    };
  };
}
