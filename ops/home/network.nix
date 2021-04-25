# ops/home/network.nix

{
  # Mara\ Configuration for the network in general.
  network = {
    # Mara\ A human-readable description.
    description = "My awesome home network";
  };

  # Mara\ This specifies the configuration for
  # `ryuko` as a NixOS module.
  "ryuko" = { config, pkgs, lib, ... }: {
    # Mara\ Import the VM-specific config as
    # well as all of the settings in
    # `common/default.nix`, including my user
    # details.
    imports = [
      ../../common/generic-libvirtd.nix
      ../../common
    ];
    
    # Mara\ The user you will SSH into the
    # machine as. This defaults to your current
    # username, however for this example we will
    # just SSH in as root.
    deployment.targetUser = "root";
    
    # Mara\ The target IP address or hostname
    # of the server we are deploying to. This is
    # the IP address of a libvirtd virtual
    # machine on my machine.
    deployment.targetHost = "192.168.122.251";
  };
}
