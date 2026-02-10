# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define hostname
  networking.hostName = "durban";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  # I'm not really sure what this does, it stops the cursor from blinking though
  hardware.enableAllFirmware = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  
  # Enables ~/.local/bin
  environment.localBinInPath = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mason = {
    isNormalUser = true;
    description = "mason";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      waybar
      thunderbird
    ];
  };

  # Enable bluetooth at the hardware level
  hardware.bluetooth.enable = true;

  # Enable steam
  programs.steam.enable = true;

  # Install firefox
  programs.firefox.enable = true;

  # Enable hyprland
  programs.hyprland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [

     # System Utilities
     vim
     wget
     git
     kitty
     hyprland
     pkgs.xfce.thunar
     htop
     btop
     swaybg
     neovim
     fish
     pfetch
     rofi
     gnumake
     neofetch
     greetd.greetd
     greetd.tuigreet
     killall
     gparted
     libnotify
     notify-desktop
     pavucontrol
     nix-output-monitor
     file
     gh
     nix-search-cli
     python3
     polkit
     xfce.tumbler
     grim
     swappy
     slurp
     hyprshot
     toilet

     # Radio
     wsjtx

     # Compatibility
     wine
     winetricks
     bottles
     libappimage
     appimage-run
     gearlever

     # Wireless
     networkmanagerapplet
     blueman

     # Desktop and Display
     dunst
     rofi
     hyprland

     # Social
     pkgs.discord
     pkgs.discordo
     weechat
     signal-desktop
    
     # Theming
     nwg-look
     gruvbox-gtk-theme
     gruvbox-dark-gtk
     gruvbox-material-gtk-theme
     gruvbox-kvantum

     # Network
     filezilla
     tigervnc
     turbovnc
     
     # Fonts
     line-awesome
     font-awesome

     # Gaming
     prismlauncher # Minecraft
     lutris
     pkgs.superTuxKart

     # Media
     spotify
     audacity
     kdePackages.kdenlive
     puddletag
     pinta
     gimp
     mpv
     vlc
     calibre
     obs-studio
     ardour

     # Office
     libreoffice

     # Development
     vscode
     pkgs.jetbrains.pycharm-community
     electron
     nodejs
     chromium

     # Security
     pkgs.kdePackages.kleopatra
     gnupg
     riseup-vpn
  ];
  

  # Services

  # Now that we have bluetooth enabled and blueman called, enable and start the blueman service
  services.blueman.enable = true;

  # OpenSSH
  # services.openssh.enable = true;
  
  # TUI greeter/sddm replacement
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu -t -r";
        user = "greeter"; # Or any other user for the greeter process
      };
    };
  };
 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
