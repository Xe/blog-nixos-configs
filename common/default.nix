# common/default.nix

# Mara\ inputs to this NixOS module. We don't use any here
# so we can ignore them all.
{ ... }:

{
  imports = [
    # Mara\ User account definitions
    ./users
  ];

  # Mara\ Clean /tmp on boot.
  boot.cleanTmpDir = true;

  # Mara\ Automatically optimize the Nix store to save space
  # by hard-linking identical files together. These savings
  # add up.
  nix.autoOptimiseStore = true;

  # Mara\ Limit the systemd journal to 100 MB of disk or the
  # last 7 days of logs, whichever happens first.
  services.journald.extraConfig = ''
    SystemMaxUse=100M
    MaxFileSec=7day
  '';

  # Mara\ Use systemd-resolved for DNS lookups, but disable
  # its dnssec support because it is kinda broken in
  # surprising ways.
  services.resolved = {
    enable = true;
    dnssec = "false";
  };
}
