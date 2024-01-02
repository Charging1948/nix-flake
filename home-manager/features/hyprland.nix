{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
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

  wayland.windowManager.hyprland = let
    hypr_term = "kitty";
  in {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    enableNvidiaPatches = true;
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, RETURN, exec, ${hypr_term}"
          "$mod, , exec, kitty"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";

        follow_mouse = 1;
        accel_profile = "flat";
        touchpad.scroll_factor = 0.1;
      };

      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        # disable auto polling for config file changes
        disable_autoreload = true;

        force_default_wallpaper = 0;

        # disable dragging animation
        animate_mouse_windowdragging = false;

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1;
      };

      # touchpad gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      xwayland.force_zero_scaling = true;

    };
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
      # borders-plus-plus
      csgo-vulkan-fix
      hyprbars
      hyprwinwrap
    ];
    extraConfig = ''
    plugin {
      csgo-vulkan-fix {
        res_w = 1280
        res_h = 800
        class = cs2
      }
    }
  '';
  };
}
