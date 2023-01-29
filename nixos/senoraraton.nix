{ config, pkgs, ...}:
{
  imports = [
    # paths to package modules
    ./usr-pkgs/sys-utils.nix
  ];
  users.users.senoraraton = {
    isNormalUser = true;
    description = "Claus";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    packages = with pkgs; [
      firefox
      #qutebrowser
      bear
      v4l-utils
      deluge
      terraform
      terraform-ls
      tflint
      #bind
      gopls
      gofumpt
      gotools
      go-outline
      gocode
      gopkgs
      godef
      golint
      delve
      ginkgo
      richgo
      gotestsum
      cpplint
      cppcheck
      checkmake
      deadnix
      statix
      alejandra
      luajitPackages.luacheck
      yamllint
      shellcheck
      nodePackages_latest.jsonlint
      dotenv-linter
      vim-vint
      awscli2
      hadolint
      nodePackages_latest.dockerfile-language-server-nodejs
      nodePackages_latest.svelte-language-server
      nodePackages_latest.typescript-language-server
      nodePackages.typescript
      nodePackages_latest.eslint_d
      nodePackages_latest.bash-language-server
      nodePackages_latest.prettier
      nodePackages_latest.vscode-langservers-extracted
      vscode-extensions.firefox-devtools.vscode-firefox-debug
      tree-sitter
      vscode-extensions.ms-vscode.cpptools
      sqls
      stripe-cli
      arduino-cli
    ];
  };
}
