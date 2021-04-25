{ config, pkgs, ... }:

let
  fetchKeys = username:
    (builtins.fetchurl "https://github.com/${username}.keys");
in {
  imports = [
    ./hardware-configuration.nix
    ../../common
  ];

  networking.hostName = "mako";
  networking.firewall.enable = false;
}
