{pkgs, ...}: {
  # colorschemes.kanagawa = {
  colorschemes.onedark = {
    enable = pkgs.lib.mkDefault true;
    # see https://github.com/navarasu/onedark.nvim for style choices
    settings.style = "warmer";
  };
}
