self: super: {
  neofetch = super.neofetch.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [ ../patches/neofetch-nixos-module.patch ];

    # Optionally, wrap neofetch to always use /etc/nufetch.conf if present
    installPhase = ''
      ${old.installPhase or ""}
      mv $out/bin/neofetch $out/bin/neofetch-real
      cat > $out/bin/neofetch <<'EOF'
      #!${super.stdenv.shell}
      if [ -f /etc/nufetch.conf ]; then
        exec $out/bin/neofetch-real --config /etc/nufetch.conf "$@"
      else
        exec $out/bin/neofetch-real "$@"
      fi
      EOF
      chmod +x $out/bin/neofetch
    '';
  });
}
