{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Optional but useful — faster evaluation with nix flakes
  nix.settings.auto-optimise-store = true;
}