{{config, lib pkgs, ... }:      
    
{    
    services = {    
        upower.enable = true;    
    
        dbus = {    
            enable =true;    
            socketActivated = true;    
            packages = [ pkgs.dconf ];
        };    
    
        xserver = {    
            enable = true;    
            startDbsSession = true;    
            layout = "us";    
        };    
    
        displayManager.defaultSession = "none+xmonad";    
    
        windowManager.xmonad = {    
            enable = true;    
            enableContribAndExtras = true;    
            };    
    
    
    };    
    
    hardware.bluetooth.enable = true;    
    services.blueman.enable = true;    
    
    systemd.services.upower.enable = true;    
}   config, lib pkgs, ... }:

{
    services = {
        upower.enable = true;

        dbus = {
            enable =true;
            socketActivated = true;
            packages = [ pkgs.dconf ]
        };
    
        xserver = {
            enable = true;
            startDbsSession = true;
            layout = "us";
        };

        displayManager.defaultSession = "none+xmonad";

        windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
            };


    };

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    systemd.services.upower.enable = true;
}
