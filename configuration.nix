{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/network.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/shell.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    ./modules/services.nix
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
