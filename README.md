# Unlink.nu

A cross-shell utility for breaking `symlinks`, written in `nu`.

## Installation

### NixOS

Import the flake in your `flake.nix`

```nix
{
    inputs = {
        unlink.url = "github:valyntyler/unlink";
        unlink.inputs.nixpkgs.follows = "nixpkgs";
    }

    # ...
}
```

Then put this anywhere in your config:

```nix
{inputs, ...}: {
    environment.systemPackages = [inputs.unlink.packages.x86_64-linux.default];
}
```

### Home Manager

Same as above, except place this in your home manager config.

```nix
{inputs, ...}: {
    home.packages = [inputs.unlink.packages.x86_64-linux.default];
}
```
