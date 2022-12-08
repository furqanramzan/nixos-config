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
    };
  };

  home.file = {
    ".config/plasma-org.kde.plasma.desktop-appletsrc" = {
      source = ./desktop-appletsrc;
    };
  };
}
