{ pkgs
, lib
, builtins
, ...
}:
{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = builtins.readFile ./config.hs;
  };
}
