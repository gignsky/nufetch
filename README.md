 ![CI Nix](https://github.com/gignsky/nufetch/actions/workflows/ci-nix.yml/badge.svg)
# nufetch

**nufetch** is an extensible, Nix-native system information tool inspired by neofetch. It is designed to be easily configured and deployed on NixOS systems, with support for both system-wide and user-specific configuration via Nix modules.

---

## Features

- **Extensible configuration:** Enable or disable info fields, add custom fields.
- **NixOS module:** Integrates cleanly with your NixOS configuration.
- **System-wide config:** Ensures all users get a consistent output.
- **Easy to use:** Simple, declarative configuration.

---

## Installation

### NixOS Module (Recommended)

Add this repository as an input to your `flake.nix`:

```nix
inputs.nufetch.url = "github:gignsky/nufetch";
```

Then, import the module in your NixOS configuration:

```nix
{
  imports = [
    inputs.nufetch.nixosModules.default
  ];
}
```

---

## Example Configuration

Add this to your `configuration.nix` to enable and configure nufetch:

```nix
{
  programs.neofetch = {
    enable = true;
    os = true;
    kernel = true;
    uptime = false;
    extraFields = {
      "CustomField" = "MyValue";
    };
  };
}
```

This will:
- Install a wrapper script so that running `neofetch` always uses your generated config.
- Place the config at `/etc/nufetch.conf`.

---

## Usage

After rebuilding your system (`sudo nixos-rebuild switch`), simply run:

```sh
nufetch
```
or
```sh
neofetch
```

Both commands will use your system-wide config at `/etc/nufetch.conf`.

---

## Development

This repo uses [Nix Flakes](https://nixos.wiki/wiki/Flakes) for reproducible development environments.

```sh
# Enter dev shell
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

TODO

---

## See Also

- [neofetch](https://github.com/dylanaraps/neofetch)
- [NixOS Modules](https://nixos.org/manual/nixos/stable/#sec-writing-modules)
