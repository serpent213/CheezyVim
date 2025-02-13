{pkgs, ...}: {
  plugins.harpoon = with pkgs.lib; {
    enable = mkDefault true;
    enableTelescope = mkDefault true;
    keymaps = {
      addFile = "hx";
      navNext = "hn";
      navPrev = "hp";
      toggleQuickMenu = "hm";
      navFile = {
        "1" = "<C-j>";
        "2" = "<C-k>";
        "3" = "<C-l>";
        "4" = "<C-m>";
      };
    };
  };
}
