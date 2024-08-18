{ config, pkgs, ... }:

{
  imports = [
	./packages
	./shell
#	./gnome
  ];

  home = {
	username = "damyr";
	homeDirectory = "/home/damyr";
	stateVersion = "23.11";
	enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}
