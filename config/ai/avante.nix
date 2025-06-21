{pkgs, ...}: {
  plugins = with pkgs.lib; {
    avante = {
      enable = mkDefault true;
      settings = {
        provider = "gemini";
        providers = {
          gemini = {
            model = "gemini-2.5-flash";
            temperature = 0;
            max_tokens = 100000;
          };
          openai = {
            endpoint = "https://api.openai.com/v1";
            model = "gpt-4o";
            extra_request_body = {
              temperature = 0; # Lower temperature for more deterministic output
              max_tokens = 100000; # Max tokens for the response
            };
          };
          claude = {
            endpoint = "https://api.anthropic.com";
            model = "claude-4-0-sonnet-latest";
            extra_request_body = {
              temperature = 0; # Lower temperature for more deterministic output
              max_tokens = 100000; # Max tokens for the response (Claude 3.5 Sonnet supports up to 200k tokens)
            };
          };
        };
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
          # auto_set_keymaps = true; # Automatically set keymaps for convenience
          # auto_apply_diff_after_generation = false;
          # support_paste_from_clipboard = false;
          minimize_diff = true; # Whether to remove unchanged lines when applying a code block
          enable_token_counting = true; # Whether to enable token counting. Default to true.
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
