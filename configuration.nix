# NixOS Configuration File.

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot  = {
    loader                = {
      grub  = {
        enable    = true;
        version   = 2;
        device    = "/dev/sda";
      };
    };

    kernel                = {
      sysctl  = {
        "vm.overcommit_memory"  = 2;
        "net.core.rmem_max"     = 4194304;
        "net.core.wmem_max"     = 1048576;
      };
    };

    initrd                = {
      kernelModules = [
        "wl"
      ];
    };

    supportedFilesystems  = [
      "zfs"
    ];

    extraModulePackages   = [
      config.boot.kernelPackages.broadcom_sta
    ];

    kernelPackages  = pkgs.linuxPackages // {
      virtualbox  = pkgs.linuxPackages.virtualbox.override {
        enableExtensionsPack  = true;
        pulseSupport          = true;
      };
    };
  };

  swapDevices = [
    {device = "/dev/sda1";}
  ];

  networking = {
    hostName          = "makaayi";
    hostId            = "939ff381";
    useDHCP           = true;

    # interfaceMonitor  = {
    #   enable  = true;
    # };
    wireless          = {
      enable  = true;
    };

    extraHosts        = ''
#   41.186.33.34 	pivotweb
'';
  };

  i18n = {
    consoleFont   = "Lat2-Terminus16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_GB.UTF-8";
  };

  time  = {
    timeZone = "Africa/Kigali";
  };

  nixpkgs = {
    config  = {
      allowUnfree = true;

      # virtualbox  = {
      #   enableExtensionsPack  = true;
      # };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wget w3m vim tmux git sl xterm ruby rubygems zsh mutt fetchmail nox stack mailutils weechat
      ghc smlnj mlton ocaml clisp racket gforth rlwrap telnet msmtp procmail yi wmsystemtray
      i7z p7zip

      gcc automake autoconf cmake gnumake pkgconfig curl bash openssl sqlite patch readline zlib htop
      libyaml libxml2 libxslt libtool bison v8 nodejs zlibStatic libyaml ncurses
    ];
  };

  services  = {
    zfs         = {
      autoSnapshot  = {
        enable    = true;
        frequent  = 8;
        monthly   = 3;
      };
    };

    postgresql  = {
      enable          = true;
      package         = pkgs.postgresql94;
      authentication  = pkgs.lib.mkOverride 10 ''
local all all trust
'';
    };

    openssh = {
      enable  = true;
    };

    xserver = {
      enable          = true;
      layout          = "us";
      xkbVariant      = "dvorak";
      xkbOptions      = "compose:caps";

      displayManager  = {
        kdm = {
          enable  = true;
        };
        # auto  = {
        #   enable  = true;
        #   user    = "rev";
        # };
      };

      # windowManager   = {
      #   xmonad  = {
      #     enable                  = true;
      #     enableContribAndExtras  = true;
      #   };
      #   default = "xmonad";
      # };

      desktopManager  = {
        xfce  = {
          enable  = true;
        };
      };
    };

    # virtualbox        = {
    #   host  = {
    #     enable  = true;
    #   };
    # };
  };

  programs  = {
    zsh = {
      enable  = true;
    };

    ssh = {
      extraConfig = ''
Host pivotweb
	HostName 41.186.33.34
	User revence
'';
    };
  };
  
  users = {
    defaultUserShell  = "/run/current-system/sw/bin/zsh";
    extraUsers        = {
      rev = {
        isNormalUser  = true;
        shell         = "/run/current-system/sw/bin/zsh";
        # extraGroups   = ["wheel" "vboxusers"];
        uid           = 1000;
      };
    };

    extraGroups   = {
      wheel = {
        members = ["rev" "revence"];
      };

      vboxusers = {
        members = ["rev" "revence"];
      };
    };
  };

  security  = {
    sudo  = {
      enable              = true;
      wheelNeedsPassword  = false;
    };
  };

  fonts = {
	  enableFontDir           = true;
	  enableGhostscriptFonts  = true;
	  fonts                   = with pkgs; [
		  corefonts inconsolata ubuntu_font_family unifont andagii caladea cantarell_fonts
      comfortaa crimson dejavu_fonts fira freefont_ttf gentium hasklig inconsolata
      libertine oldstandard poly proggyfonts quattrocento terminus_font
      ttf_bitstream_vera vistafonts 
	  ];
  };

  system  = {
    stateVersion = "15.09";
  };
}
