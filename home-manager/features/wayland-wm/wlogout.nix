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
       transition: all;
      }

      button:active, button:hover {
       background-color: ${base04};
       color: ${base07};
       outline-style: none;
      }

      #lock {
       opacity: 0.9;
      background-image: image(url("${config.icons}/round/logout.svg"), url("${config.icons}/round/logout.svg"));
      }

      #logout {
       opacity: 0.9;
       background-image: image(url("${config.icons}/round/logout.svg"), url("${config.icons}/round/logout.svg"));
      }

      #suspend {
       opacity: 0.9;
       background-image: image(url("${config.icons}/round/bedtime.svg"), url("${config.icons}/round/bedtime.svg"));
      }

      #hibernate {
       opacity: 0.9;
       background-image: image(url("${config.icons}/round/ac_unit.svg"), url("${config.icons}/round/ac_unit.svg"));
      }

      #shutdown {
       opacity: 0.9;
       background-image: image(url("${config.icons}/round/power_off.svg"), url("${config.icons}/round/power_off.svg"));
      }

      #reboot {
       opacity: 0.9;
       background-image: image(url("${config.icons}/round/loop.svg"), url("${config.icons}/round/loop.svg"));
      }

    '';
  };
}
