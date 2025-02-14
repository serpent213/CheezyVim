{pkgs, ...}: {
  plugins = with pkgs.lib; {
    avante = {
      enable = mkDefault true;
      settings = {
        provider = "openai";
        openai = {
          endpoint = "https://api.openai.com/v1";
          max_tokens = 4096;
          model = "o3-mini";
          temperature = 0;
        };
        # claude = {
        #   endpoint = "https://api.anthropic.com";
        #   max_tokens = 4096;
        #   model = "claude-3-5-sonnet-latest";
        #   temperature = 0;
        # };
        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints = {
          enabled = true;
        };
        behaviour = {
          auto_suggestions = false; # Experimental stage
          # auto_set_highlight_group = true;
          # auto_set_keymaps = true;
          # auto_apply_diff_after_generation = false;
          # support_paste_from_clipboard = false;
          # minimize_diff = true; # Whether to remove unchanged lines when applying a code block
          # enable_token_counting = true; # Whether to enable token counting. Default to true.
        };
        mappings = {
          diff = {
            both = "cb";
            next = "]x";
            none = "c0";
            ours = "co";
            prev = "[x";
            theirs = "ct";
          };
        };
        windows = {
          sidebar_header = {
            align = "center";
            rounded = true;
          };
          width = 30;
          wrap = true;
        };
      };
    };
  };
}
