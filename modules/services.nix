{ config, pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  programs.wireshark.enable = true;
}
