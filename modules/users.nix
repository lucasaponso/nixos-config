{ config, pkgs, ... }:

{
  users.users.lucasa = {
    isNormalUser = true;
    description  = "Lucas Aponso";
    extraGroups  = [ "networkmanager" "wheel" "docker" "wireshark"];
    shell        = pkgs.zsh;
  };
}
