{ config, pkgs, ...}:
{
	programs.zsh.enable=true;
	users.defaultUserShell = pkgs.zsh;
    nixpkgs.config.allowUnfree = true;
    environment.variables.EDITOR ="nvim";
    virtualisation.docker.enable = true;
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		};

    services.deluge = {
      enable = true;
      openFirewall = true;
    };
    #services.fwupd.enable = true;
}
