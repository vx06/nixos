## NixOS config

My todo-list doesn't fit in here.

Notes for new hosts:

- create GPT partition during install, 1GB FAT32 with esp flag, mounted at /boot
- secrets: .ssh private key -> .config/sops/age/keys.txt generated age key. generate public age key -> paste as &admin_user_host in .sops.yaml. openssh /etc/ssh pubkey to age key becomes host agekey in .sops.yaml
- create host file and import hardware conf

nix channel is unstable, like my mental health
