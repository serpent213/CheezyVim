{pkgs, ...}: {
  plugins.none-ls = {
    enable = pkgs.lib.mkDefault true;
    sources = {
      code_actions = {
        statix.enable = pkgs.lib.mkDefault true;
      };

      diagnostics = {
        stylelint.enable = pkgs.lib.mkDefault true;
        statix.enable = pkgs.lib.mkDefault true;
        sqlfluff = {
          enable = pkgs.lib.mkDefault true;
          package = pkgs.sqlfluff.override {
            python3Packages = pkgs.python3Packages // {
              diff-cover = pkgs.python3Packages.diff-cover.overridePythonAttrs (old: {
                # Pygments 2.21 no longer escapes quotes in HTML text nodes.
                postPatch = (old.postPatch or "") + ''
                  substituteInPlace tests/fixtures/{pycodestyle,pyflakes,pylint}_violations_report.html \
                    --replace-fail '&quot;' '"'
                '';
              });
            };
          };
        };
        pylint.enable = pkgs.lib.mkDefault true;
        mypy.enable = pkgs.lib.mkDefault true;
        markdownlint.enable = pkgs.lib.mkDefault true;
        hadolint.enable = pkgs.lib.mkDefault true;
        fish.enable = pkgs.lib.mkDefault true;
        dotenv_linter.enable = pkgs.lib.mkDefault true;
        deadnix.enable = pkgs.lib.mkDefault true;
        trail_space.enable = pkgs.lib.mkDefault true;
      };

      formatting = {
        stylua.enable = pkgs.lib.mkDefault true;
        alejandra.enable = pkgs.lib.mkDefault true;
        shfmt = {
          enable = pkgs.lib.mkDefault true;
          settings = {
            extra_args = [
              "-i"
              "4" # 4 spaces
              "-ci" # case indent
              "-sr" # space redirects
            ];
          };
        };
        gofmt.enable = pkgs.lib.mkDefault true;
        black.enable = pkgs.lib.mkDefault true;
        isort.enable = pkgs.lib.mkDefault true;
        typstyle.enable = pkgs.lib.mkDefault true;
        biome.enable = pkgs.lib.mkDefault true;
      };
    };
  };
}
