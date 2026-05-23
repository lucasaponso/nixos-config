{ config, pkgs, ... }:

{
  programs.neovim = {
    enable        = true;
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;
  };

  # ── LazyVim auto-install ───────────────────────────────────────────────
  # Clones the LazyVim starter into ~lucasa/.config/nvim on first rebuild.
  # Delete ~/.config/nvim/.lazyvim-installed to re-run.
  system.activationScripts.lazyvim = {
    deps = [ "users" ];
    text = ''
      NVIM_DIR="/home/lucasa/.config/nvim"
      MARKER="/home/lucasa/.config/nvim/.lazyvim-installed"

      if [ ! -f "$MARKER" ]; then
        echo ">>> Installing LazyVim starter..."
        rm -rf "$NVIM_DIR"

        ${pkgs.sudo}/bin/sudo -u lucasa ${pkgs.git}/bin/git clone \
          --depth 1 \
          https://github.com/LazyVim/starter \
          "$NVIM_DIR"

        rm -rf "$NVIM_DIR/.git"
        ${pkgs.sudo}/bin/sudo -u lucasa touch "$MARKER"
        echo ">>> LazyVim installed. Open nvim to finish plugin setup."
      fi
    '';
  };
}
