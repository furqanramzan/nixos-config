{
  programs.plasma = {
    enable = true;
    shortcuts = {
      "code.desktop"."_launch" = "Meta+C";
      "code.desktop"."new-empty-window" = "Meta+Shift+C";
      "google-chrome.desktop"."_launch" = "Meta+W";
      "google-chrome.desktop"."new-private-window" = "Meta+Shift+W";
      "slack.desktop"."_launch" = "Meta+B";
    };
    files = {
      # Appearance->Launce Feedback. Stop animation after n second
      klaunchrc = {
        BusyCursorSettings.Timeout = 1;
        TaskbarButtonSettings.Timeout = 1;
      };

      "kdeglobals" = {
        # Workspace Behavior->General Behavior. Clicking files or folders. true: Opens them. false: Select them.
        KDE.SingleClick = false;
        General.AllowKDEAppsToRememberWindowPositions = true;
      };

      # # Workspace Behavior->General Behavior. Animation Speed
      # "kdeglobals"."KDE"."AnimationDurationFactor" = 0.125;

      # Workspace Behavior->Screen Locking.
      kscreenlockerrc.Daemon.Autolock = false;

      # Workspace Behavior->Activities->Privacy. Disable remember opened documents.
      kactivitymanagerdrc.Plugins."org.kde.ActivityManager.ResourceScoringEnabled" = false;

      "kwinrc" = {
        # Window Management->Window Behavior->Focus. Window Activation Policy.
        Windows.FocusPolicy = "FocusFollowsMouse";

        # Display and Monitor->Night Color->Activate Night Color
        NightColor.Active = true;

        # Workspace Behavior->Virtual Desktops.
        Desktops.Id_1 = "2712f046-8567-4bd8-a5cd-087875c67faa";
        Desktops.Id_2 = "dc9f293e-8444-4d86-a9bf-7892505f54f9";
        Desktops.Id_3 = "6a07c9e5-2b55-433b-aebe-a532cf2ad11b";
        Desktops.Id_4 = "e2c38f7a-da17-4757-82e2-0b5ff53d2fac";
        # Number of workspaces
        Desktops.Number = 4;
        Desktops.Rows = 1;
        # Disable animation when switching between workspaces
        Plugins.slideEnabled = false;
      };

      # Shortcuts->Shortcuts->Add Application
      kglobalshortcutsrc = {
        "code.desktop"._k_friendly_name = "Visual Studio Code";
        "google-chrome.desktop"._k_friendly_name = "Google Chrome";
        "slack.desktop"._k_friendly_name = "Slack";
      };

      # Notifications
      plasmanotifyrc.Notifications = {
        # Show normal notifications over full screen windows.
        NormalAlwaysOnTop = true;
        # Notification pop up timeout: 8 seconds
        PopupTimeout = 8000;
      };
      # Battery full notification.
      "powerdevil.notifyrc" = {
        "Event/criticalbattery".Action = "Sound|Popup";
      };

      # Power Management->Advance Power Settings
      powerdevilrc.BatteryManagement = {
        # At critical level, put system to sleep.
        BatteryCriticalAction = 1;
        # Critical Level
        BatteryCriticalLevel = 10;
        # Low Level
        BatteryLowLevel = 20;
      };

      # Power Management->Energy Saving->On AC Power
      powermanagementprofilesrc = {
        # Dim Screen after specified milliseconds.
        "AC.DimDisplay".idleTime = null;

        # Switch off after specified milliseconds.
        "AC.DimDisplay".DPMSControl = null;

        # Disable automatic suspend.
        "AC.SuspendSession".idleTime = null;
        "AC.SuspendSession".suspendType = null;
        "AC.SuspendSession".suspendThenHibernate = null;

        # When laptop lid is closed do nothing.
        "AC.HandleButtonEvents".lidAction = 0;
        # Shutdown when power button is pressed. 0: Do Nothing. 1: Sleep. 8: Shutdown. 2: Hibernate. 32: Lock Screen. 64: Turn off screen. 16: Prompt logout dialog.
        "AC.HandleButtonEvents".powerButtonAction = 8;
        # Even when extra monitor is connected.
        "AC.HandleButtonEvents".triggerLidActionWhenExternalMonitorPresent = true;

        # When on Battery.
        "Battery.DimDisplay".idleTime = null;
        "Battery.DimDisplay".DPMSControl = null;
        "Battery.SuspendSession".idleTime = null;
        "Battery.SuspendSession".suspendType = null;
        "Battery.SuspendSession".suspendThenHibernate = null;
        "Battery.HandleButtonEvents".lidAction = 0;
        "Battery.HandleButtonEvents".powerButtonAction = 8;
        "Battery.HandleButtonEvents".triggerLidActionWhenExternalMonitorPresent = true;

        # When on low battery.
        "LowBattery.DimDisplay".idleTime = null;
        "LowBattery.DimDisplay".DPMSControl = null;
        "LowBattery.SuspendSession".idleTime = null;
        "LowBattery.SuspendSession".suspendType = null;
        "LowBattery.SuspendSession".suspendThenHibernate = null;
        "LowBattery.HandleButtonEvents".lidAction = 0;
        "LowBattery.HandleButtonEvents".powerButtonAction = 8;
        "LowBattery.HandleButtonEvents".triggerLidActionWhenExternalMonitorPresent = true;
      };

      # Accessibility->Screen Reader. Disable Screen Reader
      kaccessrc.ScreenReader.Enabled = false;

      # Default Applications
      "mimeapps.list" = {
        "Default Applications" = {
          "text/html" = "google-chrome.desktop";
          "text/plain" = "code.desktop";
          "x-scheme-handler/http" = "google-chrome.desktop";
          "x-scheme-handler/https" = "google-chrome.desktop";
        };
      };

      # Elisa Music Player
      elisarc = {
        PlayerSettings = {
          # Start playing at starup.
          PlayAtStartup = true;
          # Keep running in System Tray when main window is closed.
          ShowSystemTrayIcon = true;
        };
      };

      # Bottom Panel
      "plasma-org.kde.plasma.desktop-appletsrc" = {
        # Remove show desktop applet
        "Containments.2.Applets.18".immutability = null;
        "Containments.2.Applets.18".plugin = null;
        "Containments.2.Applets.18.Configuration".PreloadWeight = null;

        # Digital Clock
        "Containments.2.Applets.17".immutability = 1;
        "Containments.2.Applets.17".plugin = "org.kde.plasma.digitalclock";
        # "Containments.2.Applets.17.Configuration".PreloadWeight = 54;
        "Containments.2.Applets.17.Configuration.Appearance".dateFormat = "longDate";
        "Containments.2.Applets.17.Configuration.Appearance".showSeconds = true;
        # "Containments.2.Applets.17.Configuration.ConfigDialog".DialogHeight = 540;
        # "Containments.2.Applets.17.Configuration.ConfigDialog".DialogWidth = 720;

        # Task Manager
        "Containments.2.Applets.5".immutability = 1;
        "Containments.2.Applets.5".plugin = "org.kde.plasma.taskmanager";
        "Containments.2.Applets.5.Configuration.General".groupingStrategy = 0;
        "Containments.2.Applets.5.Configuration.General".maxStripes = 1;
        "Containments.2.Applets.5.Configuration.General".showToolTips = false;
        "Containments.2.Applets.5.Configuration.General".launchers = "applications:org.kde.dolphin.desktop,applications:google-chrome.desktop,applications:code.desktop";
        "Containments.2.Applets.5.Configuration.ConfigDialog".DialogHeight = 540;
        "Containments.2.Applets.5.Configuration.ConfigDialog".DialogWidth = 720;

        # System Monitor: Memory Usage
        "Containments.2.Applets.20".immutability = 1;
        "Containments.2.Applets.20".plugin = "org.kde.plasma.systemmonitor";
        "Containments.2.Applets.20.Configuration.Appearance".chartFace = "org.kde.ksysguard.piechart";
        "Containments.2.Applets.20.Configuration.Appearance".title = "Memory Usage";
        "Containments.2.Applets.20.Configuration.SensorColors"."memory/physical/used" = "61,174,233";
        "Containments.2.Applets.20.Configuration.Sensors".highPrioritySensorIds = "[\"memory/physical/used\"]";
        "Containments.2.Applets.20.Configuration.Sensors".lowPrioritySensorIds = "[\"memory/physical/total\"]";
        "Containments.2.Applets.20.Configuration.Sensors".totalSensors = "[\"memory/physical/usedPercent\"]";

        # System Monitor: CPU Usage
        "Containments.2.Applets.25".immutability = 1;
        "Containments.2.Applets.25".plugin = "org.kde.plasma.systemmonitor";
        "Containments.2.Applets.25.Configuration.Appearance".chartFace = "org.kde.ksysguard.piechart";
        "Containments.2.Applets.25.Configuration.Appearance".title = "Total CPU Use";
        "Containments.2.Applets.25.Configuration.SensorColors"."cpu/all/usage" = "61,174,233";
        "Containments.2.Applets.25.Configuration.Sensors".highPrioritySensorIds = "[\"cpu/all/usage\"]";
        "Containments.2.Applets.25.Configuration.Sensors".lowPrioritySensorIds = "[\"cpu/all/cpuCount\",\"cpu/all/coreCount\"]";
        "Containments.2.Applets.25.Configuration.Sensors".totalSensors = "[\"cpu/all/usage\"]";


        # Weather Applet
        "Containments.8.Applets.23".immutability = 1;
        "Containments.8.Applets.23".plugin = "org.kde.plasma.weather";
        # Weather Report Source
        "Containments.8.Applets.23.Configuration".source = "bbcukmet|weather|Karachi, Pakistan, PK|1174872";
        # Update report after specified n of seconds.
        "Containments.8.Applets.23.Configuration".updateInterval = 30;
        # Tooltip Information
        "Containments.8.Applets.23.Configuration".showHumidityInTooltip = false;
        "Containments.8.Applets.23.Configuration".showPressureInTooltip = false;
        "Containments.8.Applets.23.Configuration".showTemperatureInCompactMode = false;
        "Containments.8.Applets.23.Configuration".showTemperatureInTooltip = true;
        "Containments.8.Applets.23.Configuration".showWindInTooltip = false;
        # Measurement Units
        "Containments.8.Applets.23.Configuration".pressureUnit = 5028;
        "Containments.8.Applets.23.Configuration".speedUnit = 9002;
        "Containments.8.Applets.23.Configuration".temperatureUnit = 6001;
        "Containments.8.Applets.23.Configuration".visibilityUnit = 2024;
        # "Containments.8.Applets.23.Configuration.ConfigDialog".DialogHeight = 540;
        # "Containments.8.Applets.23.Configuration.ConfigDialog".DialogWidth = 720;

        # Show battery percentage.
        "Containments.8.Applets.19.Configuration.General".showPercentage = true;

        # System Tray Entries
        "Containments.8.General.".shownItems = "org.kde.plasma.weather";
        "Containments.8.General.".hiddenItems = "org.kde.plasma.nightcolorcontrol";

        # Applets order.
        "Containments.2.General".AppletOrder = "3;5;6;7;17;20;25";
      };
    };
  };
}
