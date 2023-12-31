{
  programs.fish = {
    enable = true;
    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      fish_right_prompt = ''
        ### Notify on long command completion
        # If commands runs >= 5 seconds, notify user on completion
        if test $CMD_DURATION
            if test $CMD_DURATION -gt (math "1000 * 5")
                set secs (math "$CMD_DURATION / 1000")
                notify-desktop "$history[1] -> Returned $status, took $secs seconds"
            end
        end
      '';
    };
    shellAbbrs = {
      p = "cd $XDG_PROJECTS_DIR";
      e = "cd $XDG_EXAMPLES_DIR";
      s = "cd $XDG_PRACTISES_DIR";
      tms = "tmuxinator start";
    };
  };
}
