{config, pkgs, ...}: {
  withPython3 = false;
  withRuby = false;
  dependencies.git.package = pkgs.gitMinimal;

  plugins.lsp.servers = {
    elixirls.enable = false;
    gopls.enable = false;
    tailwindcss.enable = false;
    tinymist.enable = false;
    pylsp.enable = false;
    ruff.enable = true;
  };

  plugins.none-ls.sources = {
    diagnostics = {
      fish.enable = false;
      markdownlint.enable = false;
      mypy.enable = false;
      pylint.enable = false;
      sqlfluff.enable = false;
    };
    formatting = {
      black.enable = false;
      gofmt.enable = false;
      isort.enable = false;
      typstyle.enable = false;
    };
  };

  plugins.treesitter.grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
    bash
    c
    comment
    css
    diff
    dockerfile
    fish
    git_config
    git_rebase
    gitattributes
    gitcommit
    gitignore
    html
    ini
    javascript
    jsdoc
    json
    json5
    lua
    luadoc
    luap
    make
    markdown
    markdown_inline
    nix
    printf
    python
    query
    regex
    ssh_config
    toml
    typescript
    vim
    vimdoc
    xml
    yaml
  ];
}
