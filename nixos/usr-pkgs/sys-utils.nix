{ config, pkgs, ...}:
{
  users.users.senoraraton = {
    packages = with pkgs; [
      btop
      htop
      busybox
      ripgrep
      fd
      irssi
      kitty
      nettools
      bind
      any-nix-shell
      jq
      ranger
      pfetch
    ];
  };
}
