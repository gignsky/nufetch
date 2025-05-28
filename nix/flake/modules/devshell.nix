{ inputs, ... }:
{
  perSystem = { config, self', pkgs, lib, ... }: {
    devShells.default = pkgs.mkShell {
      name = "nufetch-shell";
      inputsFrom = [
        config.treefmt.build.devShell
        config.pre-commit.devShell # See ./nix/modules/pre-commit.nix
      ];
      packages = with pkgs; [
        just
        nixd # Nix language server
        nil
        lolcat
        lazygit
        gitflow

        # dotfiles programs
        inputs.dotfiles.packages.${system}.quick-results
        inputs.dotfiles.packages.${system}.upjust
      ];
      shellHook = ''
        echo "welcome to the nix development environment for the nufetch package" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat 2> /dev/null;
      '';
    };
  };
}
