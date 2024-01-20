{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let 
  hypr_term = "kitty";
in {

  home.packages = with pkgs; [
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    hyprslurp
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    systemd = {
      enable = true;
      # Same as default, but stop graphical-session too
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
    settings = {
      env = [
        "GDK_BACKEND,wayland,x11"
        "QT_QPA_PLATFORM,wayland;xcb"
        # CLUTTER_BACKEND = "wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2.7;
        cursor_inactive_timeout = 4;
        "col.active_border" = "0xff${config.colorScheme.colors.base0C}";
        "col.inactive_border" = "0xff${config.colorScheme.colors.base02}";
      };
      group = {
        "col.border_active" = "0xff${config.colorScheme.colors.base0B}";
        "col.border_inactive" = "0xff${config.colorScheme.colors.base04}";
        groupbar = {
          font_size = 11;
        };
      };
      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";

        follow_mouse = 1;
        accel_profile = "flat";
        touchpad = {
          scroll_factor = 0.2;
          natural_scroll = true;
        };
      };

      dwindle = {
        # keep floating dimentions while tiling
        split_width_multiplier = 1.35;
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;

        # disable dragging animation
        animate_mouse_windowdragging = false;

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1;

        close_special_on_empty = true;
        # Unfullscreen when opening something
        new_window_takes_over_fullscreen = 2;
      };

      # touchpad gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      xwayland.force_zero_scaling = true;
      layerrule = [
        "blur,waybar"
        "ignorezero,waybar"
      ];

      decoration = {
        active_opacity = 0.97;
        inactive_opacity = 0.77;
        fullscreen_opacity = 1.0;
        rounding = 7;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
        };
        drop_shadow = true;
        shadow_range = 12;
        shadow_offset = "3 3";
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };
      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];

        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
        ];
      };

      windowrulev2 = [
        "float,center,size 70% 50%,dimaround,opacity 0.8 0.8,class:^(wlogout)$"
      ];

      binde = let
        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
      in [
        # Brightness control
        ",XF86MonBrightnessUp,exec,${brightnessctl} s +5%"
        ",XF86MonBrightnessDown,exec,${brightnessctl} s 5%- -n"
      ];

      bindm = [
        # Window Management
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bind = let
        swaylock = "${config.programs.swaylock.package}/bin/swaylock";
        playerctl = "${config.services.playerctld.package}/bin/playerctl";
        playerctld = "${config.services.playerctld.package}/bin/playerctld";
        makoctl = "${config.services.mako.package}/bin/makoctl";
        wofi = "${config.programs.wofi.package}/bin/wofi";
        wlogout = "${config.programs.wlogout.package}/bin/wlogout";
        # pass-wofi = "${pkgs.pass-wofi.override {
        #   pass = config.programs.password-store.package;
        # }}/bin/pass-wofi";

        grimblast = "${inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast}/bin/grimblast";
        pactl = "${pkgs.pulseaudio}/bin/pactl";
        tly = "${pkgs.tly}/bin/tly";
        gtk-play = "${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play";
        notify-send = "${pkgs.libnotify}/bin/notify-send";

        gtk-launch = "${pkgs.gtk3}/bin/gtk-launch";
        xdg-mime = "${pkgs.xdg-utils}/bin/xdg-mime";
        defaultApp = type: "${gtk-launch} $(${xdg-mime} query default ${type})";

        terminal = "kitty";
        # terminal = config.home.sessionVariables.TERMINAL;
        browser = defaultApp "x-scheme-handler/https";
        editor = defaultApp "text/plain";
      in [
        # Program bindings
        "SUPER,Return,exec,${terminal}"
        "SUPER,e,exec,${editor}"
        "SUPER,v,exec,${editor}"
        "SUPER,b,exec,${browser}"
        # Volume
        ",XF86AudioRaiseVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86AudioMute,exec,${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
        "SHIFT,XF86AudioMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        ",XF86AudioMicMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        # Screenshotting
        ",Print,exec,${grimblast} --notify --freeze copy output"
        "SHIFT,Print,exec,${grimblast} --notify --freeze copy active"
        "CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
        "SUPERSHIFT,s,exec,${grimblast} --notify --freeze copy area"
        "ALT,Print,exec,${grimblast} --notify --freeze copy area"
        # Tally counter
        "SUPER,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} add && ${gtk-play} -i dialog-information" # Add new entry
        "SUPERCONTROL,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} undo && ${gtk-play} -i dialog-warning" # Undo last entry
        "SUPERCONTROLSHIFT,z,exec,${tly} reset && ${gtk-play} -i complete" # Reset
        "SUPERSHIFT,z,exec,${notify-send} -t 1000 $(${tly} time)" # Show current time
      ] ++

      (lib.optionals config.services.playerctld.enable [
        # Media control
        ",XF86AudioNext,exec,${playerctl} next"
        ",XF86AudioPrev,exec,${playerctl} previous"
        ",XF86AudioPlay,exec,${playerctl} play-pause"
        ",XF86AudioStop,exec,${playerctl} stop"
        "ALT,XF86AudioNext,exec,${playerctld} shift"
        "ALT,XF86AudioPrev,exec,${playerctld} unshift"
        "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
      ]) ++
      # Screen lock
      (lib.optionals config.programs.swaylock.enable [
        ",XF86Launch5,exec,${swaylock} -S --grace 2"
        ",XF86Launch4,exec,${swaylock} -S --grace 2"
        "SUPER,backspace,exec,${swaylock} -S --grace 2"
      ]) ++
      # Notification manager
      (lib.optionals config.services.mako.enable [
        "SUPER,w,exec,${makoctl} dismiss"
      ]) ++

      # Launcher
      (lib.optionals config.programs.wofi.enable [
        # "SUPER,x,exec,${wofi} -S drun -x 10 -y 10 -W 25% -H 60%"
        "SUPER,d,exec,${wofi} -S run"
      ]) ++ 
      (lib.optionals config.programs.wlogout.enable [
        "SUPER,x,exec,pkill wlogout || ${wlogout}"
      ]) ++

      # Workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      (builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "SUPER, ${ws}, workspace, ${toString (x + 1)}"
              "SUPERSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );


      # monitor = map (m: let
      #   resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
      #   position = "${toString m.x}x${toString m.y}";
      # in
      #   "${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
      # ) (config.monitors);
      monitor = [
        "DP-1,highrr,auto,1"
        ",preferred,auto,1"
      ];

      # workspace = map (m:
      #   "${m.name},${m.workspace}"
      # ) (lib.filter (m: m.enabled && m.workspace != null) config.monitors);

    };
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
      # borders-plus-plus
      csgo-vulkan-fix
      hyprwinwrap
    ];
    # This is order sensitive, so it has to come here.
    extraConfig = ''
      plugin {
        csgo-vulkan-fix {
          res_w = 1280
          res_h = 800
          class = cs2
        }
      }

      # Passthrough mode (e.g. for VNC)
      bind=SUPER,P,submap,passthrough
      submap=passthrough
      bind=SUPER,P,submap,reset
      submap=reset

    '';
  };

  # Prevent issues with cursor and themes under Wayland
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

}
