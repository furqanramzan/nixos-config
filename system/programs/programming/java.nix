{pkgs, ...}: {
  programs.java = {
    enable = true; # The JDK includes JRE, also adds JAVA_HOME to the global environment.
    package = pkgs.jdk11;
  };
}
