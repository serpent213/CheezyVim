{
  autoCmd = [
    {
      event = ["BufWinEnter"];
      callback = {
        __raw = ''
          function()
              -- Disable comment continuations
              -- vim.cmd "set formatoptions-=cro"
              vim.cmd ":TSBufEnable highlight"
          end
        '';
      };
    }
    {
      event = ["FileType"];
      pattern = [
        "markdown"
      ];
      callback = {
        __raw = ''
          function()
            vim.cmd ":TSDisable highlight"
          end
        '';
      };
    }
    {
      event = ["FileType"];
      pattern = [
        "netrw"
        "Jaq"
        "qf"
        "git"
        "help"
        "man"
        "lspinfo"
        "alpha"
        "lir"
        "DressingSelect"
        ""
      ];
      callback = {
        __raw = ''
          function()
            vim.cmd [[
              nnoremap <silent> <buffer> q :close<CR>
              set nobuflisted
            ]]
          end
        '';
      };
    }
    {
      event = ["CmdWinEnter"];
      callback = {
        __raw = ''
          function()
              vim.cmd "quit"
            end
        '';
      };
    }
    {
      event = ["VimResized"];
      callback = {
        __raw = ''
          function()
              vim.cmd "tabdo wincmd ="
          end
        '';
      };
    }
    {
      event = ["VimEnter"];
      callback = {
        __raw = ''
          function()
            if vim.g.open_rpc_pipe_per_workspace then
              local function setup_rpc_socket()
                -- Inspired by https://github.com/linw1995/nvim-mcp/blob/36101b64422b54f6c75a1db33f703e60e275bfed/lua/nvim-mcp/init.lua

                -- Escape path for use in filename by replacing problematic characters
                local function escape_path(path)
                  return path:gsub("^%s+", ""):gsub("%s+$", ""):gsub("/", "%%")
                end

                -- Get git root directory
                local function get_git_root()
                  local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
                  if not handle then
                    return nil
                  end
                  local result = handle:read("*a")
                  handle:close()

                  if result and result ~= "" then
                    return result:gsub("^%s+", ""):gsub("%s+$", "") -- trim whitespace
                  end
                  return nil
                end

                -- Generate socket file path based on git root
                local function generate_socket_path()
                  local git_root = get_git_root()
                  if not git_root then
                    -- Fallback to current working directory if not in git repo
                    git_root = vim.fn.getcwd()
                  end

                  -- Extract only the last part of the path (project name)
                  local project_name = vim.fn.fnamemodify(git_root, ":t")
                  local escaped_path = escape_path(project_name)
                  local pid = vim.fn.getpid()

                  local socket_dir = os.getenv("HOME") .. "/.cache/nvim/rpc"
                  -- Create directory if it doesn't exist
                  vim.fn.mkdir(socket_dir, "p")
                  return string.format("%s/nvim-mcp.%s.%d.sock", socket_dir, escaped_path, pid)
                end

                local socket_path = generate_socket_path()

                -- Check if socket already exists to avoid conflicts
                local uv = vim.loop
                if uv.fs_stat(socket_path) then
                  -- Remove existing socket file
                  os.remove(socket_path)
                end

                -- Start Neovim RPC server on the socket
                local success, result = pcall(vim.fn.serverstart, socket_path)
                if success and result ~= "" then
                  vim.uv.fs_chmod(socket_path, tonumber('700', 8))
                  vim.notify("RPC server listening on: " .. socket_path, vim.log.levels.INFO)
                else
                  vim.notify("Failed to start RPC server on: " .. socket_path, vim.log.levels.WARN)
                end
              end

              setup_rpc_socket()
            end
          end
        '';
      };
    }
  ];
}
