{pkgs, ...}: {
  plugins.lsp = with pkgs.lib; {
    enable = mkDefault true;
    servers = {
      bashls.enable = mkDefault true;
      biome.enable = mkDefault true;
      cssls.enable = mkDefault true;
      dockerls.enable = mkDefault true;
      elixirls.enable = mkDefault true;
      # elixirls.package = pkgs.elixir-ls;
      gopls.enable = mkDefault true;
      html.enable = mkDefault true;
      htmx.enable = mkDefault true;
      jsonls.enable = mkDefault true;
      lua_ls.enable = mkDefault true;
      marksman.enable = mkDefault true;
      nil_ls.enable = mkDefault true;
      pylsp.enable = mkDefault true;
      pyright.enable = mkDefault true;
      solargraph.enable = mkDefault true;
      tailwindcss.enable = mkDefault true;
      taplo.enable = mkDefault true;
      tinymist.enable = mkDefault true;
      ts_ls.enable = mkDefault true;
      yamlls.enable = mkDefault true;
    };
  };

  plugins.lsp-format.enable = pkgs.lib.mkDefault true;
}
