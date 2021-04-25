{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common
  ];

  networking.hostName = "mako";
  networking.firewall.enable = false;
}
