{ pkgs
, ...
}:
{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./config.hs;
  };
}
