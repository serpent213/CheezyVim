{pkgs, ...}: {
  plugins.lsp = with pkgs.lib; {
    enable = mkDefault true;
    servers = {
      bashls.enable = mkDefault true;
      biome.enable = mkDefault true;
      cssls.enable = mkDefault true;
      dockerls.enable = mkDefault true;
      elixirls = {
        enable = mkDefault true;
        # package = pkgs.elixir-ls;
        settings = {
          # MCP Server settings
          mcpEnabled = true;
        };
        # onAttach.function = ''
        #   -- Disable semantic tokens for all LSP servers
        #   client.server_capabilities.semanticTokensProvider = nil
        # '';
      };
      gopls.enable = mkDefault true;
      html.enable = mkDefault true;
      # htmx.enable = mkDefault true;
      jsonls.enable = mkDefault true;
      lua_ls.enable = mkDefault true;
      marksman.enable = mkDefault true;
      nil_ls.enable = mkDefault true;
      pylsp.enable = mkDefault true;
      pyright.enable = mkDefault true;
      tailwindcss = {
        enable = mkDefault true;
        # from https://github.com/MatthiasBenaets/nix-config/blob/master/modules/editors/nvim.nix#L480
        # filetypes = [
        #   "clojure"
        #   "css"
        #   "django-html"
        #   "eelixir"
        #   "ejs"
        #   "elixir"
        #   "gohtml"
        #   "gohtmltmpl"
        #   "haml"
        #   "handlebars"
        #   "heex"
        #   "html"
        #   "html-eex"
        #   "htmldjango"
        #   "javascript"
        #   "javascriptreact"
        #   "js"
        #   "jsx"
        #   "less"
        #   "mdx"
        #   "mustache"
        #   "php"
        #   "postcss"
        #   "sass"
        #   "scss"
        #   "stylus"
        #   "svelte"
        #   "ts"
        #   "tsx"
        #   "typescript"
        #   "typescriptreact"
        # ];
        # extraOptions = {
        #   init_options = {
        #     userLanguages = {
        #       elixir = "html-eex";
        #       eelixir = "html-eex";
        #       heex = "html-eex";
        #     };
        #   };
        # };
        # settings = {
        #   tailwindCSS = {
        #     classAttributes = [
        #       "class"
        #       "className"
        #       "class:list"
        #       "classList"
        #       "ngClass"
        #     ];
        #     experimental = {
        #       classRegex = ''class[:]\s*"([^"]*)"'';
        #     };
        #   };
        # };
        # onAttach = {
        #   override = true;
        #   function = ''
        #     client.server_capabilities.documentFormattingProvider = false
        #     client.server_capabilities.documentRangeFormattingProvider = false
        #   '';
        # };
      };
      taplo.enable = mkDefault true;
      tinymist.enable = mkDefault true;
      ts_ls.enable = mkDefault true;
      yamlls.enable = mkDefault true;
    };
  };

  plugins.lsp-format = {
    enable = pkgs.lib.mkDefault true;
    # settings = {
    #   elixir = {
    #     order = ["elixirls"];
    #   };
    # };
  };
}
