{pkgs, ...}: {
  plugins = with pkgs.lib; {
    direnv.enable = mkDefault true;
    markdown-preview.enable = mkDefault false;
    nvim-autopairs = {
      enable = mkDefault false;
      settings.checkTs = mkDefault true;
    };
    bacon.enable = mkDefault true;
    lastplace.enable = mkDefault true;
    todo-comments = {
      enable = mkDefault true;
      settings = {
        mergeKeywords = mkDefault true;
        highlight = {
          before = "";
          after = "fg";
          keyword = "wide";
        };
        keywords = {
          QUESTION = {icon = "";};
        };
      };
    };
    comment.enable = mkDefault true;
    sleuth.enable = mkDefault true;
    nvim-tree = {
      enable = mkDefault true;
      updateFocusedFile.enable = mkDefault true;
    };
    nvim-ufo.enable = mkDefault true;
    toggleterm = {
      enable = mkDefault true;
      settings = {
        direction = "float";
        floatOpts = {border = "single";};
        terminalMappings = mkDefault true;
      };
    };
    illuminate = {
      enable = mkDefault true;
      underCursor = mkDefault true;
    };
    navic = {
      enable = mkDefault true;
      settings = {
        highlight = mkDefault true;
        lsp.autoAttach = mkDefault true;
      };
    };
    colorizer.enable = mkDefault true;
    marks.enable = mkDefault true;
    vim-matchup = {
      enable = mkDefault true;
      settings = mkDefault {
        surround_enabled = mkDefault 1;
        transmute_enabled = mkDefault 1;
      };
      treesitter = mkDefault {
        enable = mkDefault true;
      };
    };
    web-devicons.enable = true;
  };
}
