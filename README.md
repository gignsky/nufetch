![CI Nix](https://github.com/gignsky/nufetch/actions/workflows/ci-nix.yml/badge.svg)
# nufetch

**nufetch** is an extensible, Nix-native system information tool designed to allow nix-like configuration of the [neofetch](https://github.com/dylanaraps/neofetch) tool. It provides both NixOS and Home Manager modules, allowing you to declaratively configure and extend neofetch using Nix. With nufetch, you can easily enable or disable information fields, add custom fields, and ensure consistent configuration across your system or user environments.

---

## Features

- **Nix Flake:** Provides modules for both NixOS and Home Manager, making integration seamless.
- **Extensible configuration:** Enable or disable neofetch info fields, and add custom fields via Nix options.
- **System-wide and user-specific configs:** Configure neofetch globally (system-wide) or per-user.
- **Consistent output:** Ensures all users or environments get a reproducible, declarative neofetch configuration.
- **Easy to use:** Simple, declarative configuration using Nix modules.
- **Automatic config generation:** Generates the neofetch config file from your Nix options.
- **Wrapper scripts:** Installs a `nufetch` wrapper and ensures `neofetch` uses the generated config.

---

## Installation

### As a Nix Flake Input

Add this repository as an input to your `flake.nix`:

```nix
inputs.nufetch.url = "github:gignsky/nufetch";
```

---

### NixOS Module

Import the Nufetch NixOS module in your system configuration:

```nix
{
  imports = [
    inputs.nufetch.nixosModules.default
  ];
}
```

---

### Home Manager Module

Import the Nufetch Home Manager module in your user configuration:

```nix
{
  imports = [
    inputs.nufetch.homeManagerModules.default
  ];
}
```

---

## Example Configuration

### NixOS

Add this to your `configuration.nix` to enable and configure nufetch system-wide:

```nix
{
  programs.nufetch = {
    enable = true;
    os = true;
    kernel = true;
    uptime = false;
    extraPrintInfoFields =''{
      info "Public IP: " public_ip
    '';
  };
}
```

This will:
- Install a `nufetch` wrapper script so that running `nufetch` or `neofetch` always uses your generated config.
- Place the config at `/etc/nufetch.conf` for system-wide use.

---

### Home Manager

Add this to your Home Manager configuration for per-user setup:

```nix
{
  programs.nufetch = {
    enable = true;
    os = true;
    kernel = true;
    uptime = false;
    extraPrintInfoFields =''{
      info "Public IP: " public_ip
    '';
  };
}
```

This will:
- Install a `nufetch` wrapper script in your user environment.
- Place the config at `$HOME/.config/neofetch/config.conf` for user-specific use.

---

## Usage

After rebuilding your system or user environment, simply run:

```sh
nufetch
```
or
```sh
neofetch
```

Both commands will use your generated config (`/etc/nufetch.conf` for NixOS, or `~/.config/neofetch/config.conf` for Home Manager).

---

## Development

This repo uses [Nix Flakes](https://nixos.wiki/wiki/Flakes) for reproducible development environments.

```sh
# Enter the development shell
nix develop

# Build the project
nix build

# Run the tool
nix run
```

---

## Contributing

Contributions are welcome! Please open issues or pull requests on [GitHub](https://github.com/gignsky/nufetch).

---

## License

This project is licensed under the GNU General Public License v3.0. See [LICENSE](LICENSE) for details.

---

## See Also

- [neofetch](https://github.com/dylanaraps/neofetch)
- [NixOS Modules](https://nixos.org/manual/nixos/stable/#sec-writing-modules)
- [Home Manager](https://nix-community.github.io/home-manager/)
