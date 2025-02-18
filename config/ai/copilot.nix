{pkgs, ...}: {
  plugins = with pkgs.lib; {
    copilot-lua = {
      enable = mkDefault true;
      settings = {
        # Only use with cmp
        panel.enabled = false;
        suggestion.enabled = false;
      };
    };
  };
}
