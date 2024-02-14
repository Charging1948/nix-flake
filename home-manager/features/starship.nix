{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = with config.colorScheme.palette; {
      format = let
        git = "$git_branch$git_commit$git_state$git_status";
        cloud = "$aws$gcloud$openstack";
      in ''
        $username$hostname($shlvl)($cmd_duration) $fill ($nix_shell)$custom
        $directory(${git})(- ${cloud}) $fill $time
        $jobs$character
      '';

      fill = {
        symbol = " ";
        disabled = false;
      };

      # Core
      username = {
        format = "[$user]($style)";
        show_always = true;
      };
      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold #${base0B}";
      };
      shlvl = {
        format = "[$shlvl]($style) ";
        style = "bold #${base0C}";
        threshold = 2;
        repeat = true;
        disabled = false;
      };
      cmd_duration = {format = "took [$duration]($style) ";};

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };
      nix_shell = {
        format = "[($name \\(develop\\) <- )$symbol]($style) ";
        impure_msg = "";
        symbol = " ";
        style = "bold #${base08}";
      };

      character = {
        error_symbol = "[~~>](bold #${base08})";
        success_symbol = "[->>](bold #${base0B})";
        vimcmd_symbol = "[<<-](bold #${base0A})";
        vimcmd_visual_symbol = "[<<-](bold #${base0C})";
        vimcmd_replace_symbol = "[<<-](bold #${base07})";
        vimcmd_replace_one_symbol = "[<<-](bold #${base07})";
      };

      time = {
        format = "\\[[$time]($style)\\]";
        disabled = false;
      };

      # Cloud
      gcloud = {
        format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
      };
      aws = {format = "on [$symbol$profile(\\($region\\))]($style)";};

      # Icon changes only \/
      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      gcloud.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      nim.symbol = "󰆥 ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      shlvl.symbol = "";
      swift.symbol = "󰛥 ";
      terraform.symbol = "󱁢";
    };
  };
}
