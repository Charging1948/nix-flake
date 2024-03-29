{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (config.colorScheme) palette;
  hyprbars = inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars.override {
    # Make sure it's using the same hyprland package as we are
    hyprland = config.wayland.windowManager.hyprland.package;
  };
in {
  wayland.windowManager.hyprland = {
    plugins = [hyprbars];
    settings = {
      "plugin:hyprbars" = {
        bar_height = 25;
        bar_color = "0xdd${palette.base00}";
        "col.text" = "0xee${palette.base05}";
        # bar_text_font = config.fontProfiles.regular.family;
        bar_text_size = 12;
        bar_part_of_window = true;
        hyprbars-button = let
          closeAction = "hyprctl dispatch killactive";

          isOnSpecial = ''
            hyprctl activewindow -j | jq -re 'select(.workspace.name == "special")' >/dev/null'';
          moveToSpecial = "hyprctl dispatch movetoworkspacesilent special";
          moveToActive = "hyprctl dispatch movetoworkspacesilent name:$(hyprctl -j activeworkspace | jq -re '.name')";
          minimizeAction = "${isOnSpecial} && ${moveToActive} || ${moveToSpecial}";

          maximizeAction = "hyprctl dispatch togglefloating";
        in [
          # Red close button
          "rgb(${palette.base08}),12,,${closeAction}"
          # Yellow "minimize" (send to special workspace) button
          "rgb(${palette.base0A}),12,,${minimizeAction}"
          # Green "maximize" (togglefloating) button
          "rgb(${palette.base0B}),12,,${maximizeAction}"
        ];
      };
      bind = let
        barsEnabled = "hyprctl -j getoption plugin:hyprbars:bar_height | ${
          lib.getExe pkgs.jq
        } -re '.int != 0'";
        setBarHeight = height: "hyprctl keyword plugin:hyprbars:bar_height ${toString height}";
        toggleOn =
          setBarHeight
          config.wayland.windowManager.hyprland.settings."plugin:hyprbars".bar_height;
        toggleOff = setBarHeight 0;
      in ["SUPER,m,exec,${barsEnabled} && ${toggleOff} || ${toggleOn}"];
    };
  };
}
