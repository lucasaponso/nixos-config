{ config, pkgs, ... }:

{
  networking.hostName            = "nixos";
  networking.networkmanager.enable = true;

  services.openssh = {
    enable                        = true;
    settings.PasswordAuthentication = true;
  };
}
