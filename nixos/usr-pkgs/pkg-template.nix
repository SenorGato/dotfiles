{ config, pkgs, ...}:
{
  users.users.senoraraton = {
    packages = with pkgs; [
    ];
  };
}
