# common/generic-libvirtd.nix

# Mara\ This time all we need is the `modulesPath`
# to grab an optional module out of the default
# set of modules that ships in nixpkgs.
{ modulesPath, ... }:

{
  # Mara\ Set a bunch of QEMU-specific options that
  # aren't set by default.
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  # Mara\ Enable SSH daemon support.
  services.openssh.enable = true;

  # Mara\ Make sure the virtual machine can boot
  # and attach to its disk.
  boot.initrd.availableKernelModules =
    [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];

  # Mara\ Other boot settings that we're leaving
  # to the defaults.
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # Mara\ This VM boots with grub.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";

  # Mara\ Mount /dev/vda1 as the root filesystem.
  fileSystems."/" = {
    device = "/dev/vda1";
    fsType = "ext4";
  };
}
