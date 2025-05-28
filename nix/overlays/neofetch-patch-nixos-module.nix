self: super: {
  neofetch = super.neofetch.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [ ../patches/neofetch-nixos-module.patch ];
    # Debug output
    postPatch = (old.postPatch or "") + ''
      echo ">>> neofetch-nixos-module.patch applied"
    '';
  });
}
