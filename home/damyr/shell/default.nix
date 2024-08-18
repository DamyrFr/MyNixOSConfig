{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Damyr";
    userEmail = "thomas@anvir.fr";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #enableAutosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      fuck = "sudo !!";
      psg = "ps aux | grep";
      t = "tmux -u";
      p = "ping -c 3";
      s = "ssh";
      d = "docker";
      l = "ls -lra --color=auto";
      v = "nvim";
      c = "curl";
      ex = "extract";
      hs = "history | grep";
      ls = "ls --color=auto";
      ll = "ls --color=auto -lh";
      lll = "ls --color=auto -lh | less";
      weather = "curl http://wttr.in/";
      wth = "curl http://wttr.in/";
      getip = "wget -qO- ifconfig.co";
      pubip = "wget -qO- ifconfig.co";
      python = "python3";
      py = "python3";
      pip = "pip3";
      sw = "sudo su";
      ip = "ip --color";
      i = "ip --color --brief a";
      gc = "git commit -m";
      ga = "git add";
      gpo = "git push origin";
      gs = "git status";
      gac = "git add . && git commit -a -m ";
      dtrash = "docker run -it --rm -v /tmp:/tmp debian:latest /bin/bash";
      ks = "ls";
      xs = "cd";
      av = "aws-vault";
      sl = "ls";
      grep = "grep --color=auto";
      pr = "pass generate -i";
      k = "kubectl";
      docker = "podman";
    };
    sessionVariables = {
        PASSWORD_STORE_GENERATED_LENGTH = "32";
        AWS_VAULT_BACKEND = "pass";
        AWS_SDK_LOAD_CONFIG = "true";
    };
    zplug = {
    	enable = true;
    	plugins = [
    		{ name = "nnao45/zsh-kubectl-completion"; }
    		{ name = "zsh-users/zsh-autosuggestions"; }
    		{ name = "mattberther/zsh-pyenv"; }
    		{ name = "wfxr/forgit"; }
    	];
    };
    initExtra = builtins.readFile ./extra-zshrc;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "$HOME/.password-store";
    };
    package = pkgs.pass.withExtensions (p: [p.pass-otp]);
  };
}
