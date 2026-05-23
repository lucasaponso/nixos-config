{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh          # GitHub CLI — gh auth login, gh repo clone, etc.
    git-crypt   # encrypt secrets in git repos
  ];

  # ── Global git config ──────────────────────────────────────────────────
  # Written to /etc/gitconfig — applies to all users on the system.
  # Per-user overrides still work via ~/.gitconfig as normal.
  programs.git = {
    enable = true;
    config = {
      user = {
        name  = "Lucas Aponso";
        email = "s3896348@student.rmit.edu.au";  # replace with your GitHub email
      };

      init = {
        defaultBranch = "main";
      };

      core = {
        editor    = "code --wait";
        autocrlf  = "input";   # normalise line endings on commit
      };

      pull = {
        rebase = true;          # cleaner history than merge commits
      };

      push = {
        autoSetupRemote = true; # no need to set upstream manually
      };
    };
  };

  # ── SSH key auto-generation ────────────────────────────────────────────
  # Generates an ed25519 SSH key for lucasa on first rebuild if one
  # doesn't already exist. You then add the public key to GitHub.
  system.activationScripts.githubSshKey = {
    deps = [ "users" ];
    text = ''
      SSH_DIR="/home/lucasa/.ssh"
      KEY="$SSH_DIR/id_ed25519"

      if [ ! -f "$KEY" ]; then
        echo ">>> Generating SSH key for GitHub..."

        ${pkgs.sudo}/bin/sudo -u lucasa \
          ${pkgs.openssh}/bin/ssh-keygen \
            -t ed25519 \
            -C "s3896348@student.rmit.edu.au" \
            -f "$KEY" \
            -N ""

        # Add GitHub to known_hosts so first push doesn't prompt
        ${pkgs.sudo}/bin/sudo -u lucasa \
          ${pkgs.openssh}/bin/ssh-keyscan -H github.com \
          >> "$SSH_DIR/known_hosts"

        echo ">>> SSH key generated."
        echo ">>> Add this public key to GitHub (Settings > SSH Keys):"
        echo "───────────────────────────────────────────────────────"
        cat "$KEY.pub"
        echo "───────────────────────────────────────────────────────"
      fi
    '';
  };
}
