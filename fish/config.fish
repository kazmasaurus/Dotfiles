
# Path party
# Important that Path party kicks off the night, otherwise later commands
# may not have access to anything we expect to be installed through `brew`
set PATH "/usr/local/sbin" $PATH
set PATH "/opt/homebrew/bin" $PATH

# Wrap hub in `git`
eval (hub alias -s)

