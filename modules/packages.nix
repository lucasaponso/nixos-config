{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # ── LazyVim runtime dependencies ──────────────────────────────────
    git
    ripgrep
    fd
    fzf
    gcc
    gnumake
    nodejs
    unzip

    # ── LSP servers ───────────────────────────────────────────────────
    lua-language-server
    pyright
    nixd
    nodePackages.typescript-language-server

    # ── Formatters / linters ──────────────────────────────────────────
    stylua
    black
    alejandra
    prettierd

    # ── Clipboard (Wayland) ───────────────────────────────────────────
    wl-clipboard

    # ── Shell & terminal ──────────────────────────────────────────────
    zsh
    kitty
    btop
    curl
    wget
    sshfs

    # ── Hyprland ecosystem ────────────────────────────────────────────
    waybar
    wofi
    dunst
    hyprpaper
    grim
    slurp

    # ── Editors ───────────────────────────────────────────────────────
    vscode

    # ── Dev tools ─────────────────────────────────────────────────────
    python3
    bun
    docker-compose

  ];
}
