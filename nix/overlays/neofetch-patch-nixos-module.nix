# Overlay to patch neofetch so that its default config file location is changed.
# This applies the patch at ../patches/neofetch-nixos-module.patch, which modifies
# neofetch to look for its configuration in a different location (e.g., /etc/nufetch.conf)
# instead of the default. This is useful for system-wide or declarative configuration
# via the nufetch NixOS module.
#
# The postPatch step prints a debug message to confirm the patch was applied.

self: super: {
  neofetch = super.neofetch.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [ ../patches/neofetch-nixos-module.patch ];
    # Debug output
    postPatch = (old.postPatch or "") + ''
      echo ">>> neofetch-nixos-module.patch applied"
    '';
  });
}
