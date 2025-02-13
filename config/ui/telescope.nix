{pkgs, ...}: {
  plugins.telescope = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      defaults = {
        path_display = ["truncate"];
        sorting_strategy = "ascending";
        layout_config = {horizontal = {prompt_position = "top";};};
      };
      pickers = {
        find_files = {theme = "dropdown";};
        git_files = {theme = "dropdown";};
        fd = {theme = "dropdown";};
        buffers = {theme = "dropdown";};
        marks = {theme = "dropdown";};
        registers = {theme = "dropdown";};
        jumplist = {theme = "dropdown";};
        git_branches = {theme = "dropdown";};
        git_commits = {theme = "dropdown";};
        live_grep = {theme = "ivy";};
        current_buffer_fuzzy_find = {theme = "ivy";};
        help_tags = {theme = "dropdown";};
        man_pages = {theme = "ivy";};
        keymaps = {theme = "dropdown";};
        vim_options = {theme = "dropdown";};
        commands = {theme = "dropdown";};
      };
      mappings = {
        n = {
          "<C-j>" = {
            __raw = "require('telescope.actions').move_selection_next";
          };
          "<C-k>" = {
            __raw = "require('telescope.actions').move_selection_previous";
          };
          "<C-n>" = {
            __raw = "require('telescope.actions').cycle_history_next";
          };
          "<C-p>" = {
            __raw = "require('telescope.actions').cycle_history_prev";
          };
        };
        i = {
          "<C-j>" = {
            __raw = "require('telescope.actions').move_selection_next";
          };
          "<C-k>" = {
            __raw = "require('telescope.actions').move_selection_previous";
          };
        };
      };
    };
    extensions = {
      fzf-native = {
        enable = pkgs.lib.mkDefault true;
        settings.caseMode = "smart_case";
      };
      frecency = {
        enable = pkgs.lib.mkDefault true;
        settings = {
          showUnindexed = pkgs.lib.mkDefault true;
          defaultWorkspace = "CWD";
        };
      };
      undo = {
        enable = pkgs.lib.mkDefault true;
        settings.useDelta = pkgs.lib.mkDefault true;
      };
      project = {
        enable = pkgs.lib.mkDefault true;
        settings = {
          base_dirs = [
            "~/Documents/213tec"
            "~/Documents/projects"
          ];
          on_project_selected = {
            __raw = ''
              function(prompt_bufnr)
                require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
                -- require("harpoon.ui").nav_file(1)
              end
            '';
          };
          order_by = "asc";
          search_by = "title";
          sync_with_nvim_tree = true;
          theme = "dropdown";
        };
      };
    };
    keymaps = {
      "<leader>f" = {
        action = "git_files";
        options.desc = "Files";
      };
      "<leader>s" = {
        action = "live_grep";
        options.desc = "Search Text";
      };
    };
  };
}
