## NixOS config

**some of the todos**:

- [ ] neovim (finally)
- [ ] yazi configuration
- [ ] steam etc.
- [ ] more software, e.g. orcaslicer
      ...

- for drax host reinstall: facter hardware configuration, disko fs management
- check bios if csm is enabled

**Notes for new hosts:**

- create GPT partition during install, 1GB FAT32 with esp flag, mounted at /boot
- secrets: .ssh private key -> .config/sops/age/keys.txt generated age key. generate public age key -> paste as &admin_user_host in .sops.yaml. openssh /etc/ssh pubkey to age key becomes host agekey in .sops.yaml
- create host file and import hardware conf
- prismlauncher currently requires SDL_VIDEO_DRIVER=wayland as env variable, have to look into that later

nix channel is unstable, like my mental health
