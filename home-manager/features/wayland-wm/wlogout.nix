{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "swaylock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
    ];
    style = with config.colorScheme.palette; ''
          * {
       background-image: none;
      }

      button {
       background-color: ${base01};
       border-width: 0px;
       border-radius: 0;
       background-repeat: no-repeat;
       background-position: center;
       background-size: 25%;
       color: ${base06};
      }

      button:active, button:hover {
       background-color: ${base04};
       color: ${base07};
       outline-style: none;
      }

      #lock {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/logout.png"), url("${pkgs.wlogout}/icons/logout.png"));
      }

      #logout {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/logout.png"), url("${pkgs.wlogout}/icons/logout.png"));
      }

      #suspend {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/suspend.png"), url("${pkgs.wlogout}/icons/suspend.png"));
      }

      #hibernate {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/hibernate.png"), url("${pkgs.wlogout}/icons/hibernate.png"));
      }

      #shutdown {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/shutdown.png"), url("${pkgs.wlogout}/icons/shutdown.png"));
      }

      #reboot {
       opacity: 0.9;
       background-image: image(url("${pkgs.wlogout}/icons/reboot.png"), url("${pkgs.wlogout}/icons/reboot.png"));
      }

    '';
  };
}
