# common/users/default.nix

# Mara\ Inputs to this NixOS module, in this case we are
# using `pkgs` so I can configure my favorite shell fish
# and `config` so we can make my SSH key also work with
# the root user.
{ config, pkgs, ... }:

{
  # Mara\ The block that specifies my user account.
  users.users.mara = {
    # Mara\ This account is intended for a non-system user.
    isNormalUser = true;

    # Mara\ The shell that the user will default to. This
    # can be any NixOS package, even PowerShell!
    shell = pkgs.fish;

    # Mara\ My SSH keys.
    openssh.authorizedKeys.keys = [
      # Mara\ Replace this with your SSH key!
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPg9gYKVglnO2HQodSJt4z4mNrUSUiyJQ7b+J798bwD9"
    ];
  };

  # Mara\ Use my SSH keys for logging in as root.
  users.users.root.openssh.authorizedKeys.keys =
    config.users.users.mara.openssh.authorizedKeys.keys;
}
