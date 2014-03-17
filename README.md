conf
====

Custom application configuration files and dotfiles

dotfilelist.txt is the definitive list of what this contains, and is the path in the conf repository followed by the path that the system looks for the file within the home directory.

linkfiles.bash is a script to link new config files so that the file in the conf repo is used.

Conf should be directly under your home directory in a folder named conf, e.g. "/home/blake/conf", so the linklist script would be at "/home/blake/conf/linklist.bash". This is because the script and some of the other configs make assumptions about where the conf repository will be.
