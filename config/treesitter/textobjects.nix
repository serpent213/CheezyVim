{pkgs, ...}: {
  plugins.treesitter-textobjects = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      select = {
        enable = pkgs.lib.mkDefault true;
        lookahead = pkgs.lib.mkDefault true;
        keymaps = {
          "af" = {
            query = "@function.outer";
            desc = "Select outer function";
          };
          "if" = {
            query = "@function.inner";
            desc = "Select inner function";
          };
          "ao" = {
            query = "@class.outer";
            desc = "Select outer class";
          };
          "io" = {
            query = "@class.inner";
            desc = "Select inner class";
          };
          "ac" = {
            query = "@conditional.outer";
            desc = "Select outer conditional";
          };
          "ic" = {
            query = "@conditional.inner";
            desc = "Select inner conditional";
          };
          "al" = {
            query = "@loop.outer";
            desc = "Select outer loop";
          };
          "il" = {
            query = "@loop.inner";
            desc = "Select inner loop";
          };
        };
      };
      swap = {
        enable = pkgs.lib.mkDefault true;
        swap_next = {
          "<leader>pn" = {
            query = "@parameter.inner";
            desc = "Parameter swap next";
          };
        };
        swap_previous = {
          "<leader>pp" = {
            query = "@parameter.inner";
            desc = "Parameter swap prev";
          };
        };
      };
      move = {
        enable = pkgs.lib.mkDefault true;
        set_jumps = pkgs.lib.mkDefault true;
        goto_next_start = {
          "]f" = {
            query = "@function.outer";
            desc = "Next function start";
          };
          "]c" = {
            query = "@conditional.outer";
            desc = "Next conditional start";
          };
          "]l" = {
            query = "@loop.outer";
            desc = "Next loop start";
          };
          "]o" = {
            query = "@class.outer";
            desc = "Next class start";
          };
        };
        goto_next_end = {
          "]F" = {
            query = "@function.outer";
            desc = "Next function end";
          };
          "]C" = {
            query = "@conditional.outer";
            desc = "Next conditional end";
          };
          "]L" = {
            query = "@loop.outer";
            desc = "Next loop end";
          };
          "]O" = {
            query = "@class.outer";
            desc = "Next class end";
          };
        };
        goto_previous_start = {
          "[f" = {
            query = "@function.outer";
            desc = "Previous function start";
          };
          "[c" = {
            query = "@conditional.outer";
            desc = "Previous conditional start";
          };
          "[l" = {
            query = "@loop.outer";
            desc = "Previous loop start";
          };
          "[o" = {
            query = "@class.outer";
            desc = "Previous class start";
          };
        };
        goto_previous_end = {
          "[F" = {
            query = "@function.outer";
            desc = "Previous function end";
          };
          "[C" = {
            query = "@conditional.outer";
            desc = "Previous conditional end";
          };
          "[L" = {
            query = "@loop.outer";
            desc = "Previous loop end";
          };
          "[O" = {
            query = "@class.outer";
            desc = "Previous class end";
          };
        };
      };
    };
  };
}
