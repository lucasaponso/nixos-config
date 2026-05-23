{ config, pkgs, ... }:

{
  # ── Hyprland ───────────────────────────────────────────────────────────
  programs.hyprland = {
    enable          = true;
    xwayland.enable = true;
  };

  # ── Display manager ────────────────────────────────────────────────────
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user    = "greeter";
      };
    };
  };

  # ── XDG portal (screen sharing, file pickers) ──────────────────────────
  xdg.portal = {
    enable       = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # ── Wayland env vars ───────────────────────────────────────────────────
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # ── Security (required by Hyprland) ───────────────────────────────────
  security.polkit.enable = true;
}
