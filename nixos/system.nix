{ config, pkgs, ...}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "buddha";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  fonts.fonts = with pkgs; [
  source-code-pro
  ];
  environment.systemPackages = with pkgs; [
	neovim    
	chromium
	wget
	zsh
	git
	gnumake
	#cmake
    cmakeWithGui
	python3Full
	gcc
    go
	nodePackages.npm
    nodePackages_latest.webpack
    nodePackages_latest.webpack-cli
    bc

	nodePackages.graphql
    python310Packages.pip
	nodejs
	rustc
	cargo
	tmux
	feh
	pciutils
	usbutils
	unzip
	node2nix
	file
	fzf
	nix-index
	sumneko-lua-language-server
	clang
	clang-tools
	rust-analyzer
	docker
    docker-compose
    ffmpeg
    sox
    mpv
    gdb
  ];
}
