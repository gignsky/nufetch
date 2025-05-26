{ lib, ... }:
{
  config = { };
  options = {
    programs.nufetch = {
      enable = lib.enableOption {
        default = false;
        description = "Enable Neofetch with custom options, a command-line utility to display system information.";
      };
      os = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch OS information display.";
      };
      host = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Host information display.";
      };
      kernel = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Kernel information display.";
      };
      uptime = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Uptime information display.";
      };
      packages = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Packages information display.";
      };
      shell = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Shell information display.";
      };
      resolution = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Resolution information display.";
      };
      de = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Desktop Environment information display.";
      };
      wm = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Window Manager information display.";
      };
      wm_theme = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Window Manager Theme information display.";
      };
      theme = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Theme information display.";
      };
      icons = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Icons display.";
      };
      terminal = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Terminal information display.";
      };
      terminal_font = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Terminal information display.";
      };
      cpu = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch CPU information display.";
      };
      gpu = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch GPU information display.";
      };
      memory = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Memory information display.";
      };
      cpu_usage = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch CPU Usage information display.";
      };
      disk = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Disk information display.";
      };
      battery = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Battery information display.";
      };
      font = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Font information display.";
      };
      song = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Song information display.";
      };
      local_ip = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Neofetch Local IP information display.";
      };
      public_ip = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Public IP information display.";
      };
      users = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Users information display.";
      };
      birthday = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Neofetch Birthday information display.";
      };
      extraFields = lib.mkOption {
        type = lib.types.attrsOf lib.types.str;
        default = { };
        description = "Extra fields to display in Neofetch. Use this to add custom information.";
      };
    };
  };
}
