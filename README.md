# Dotfiles

More than just Dotfiles. It's more or less intended to be a one stop shop for getting a new machine up and running.

## Installation

```shell
# Pull down the dependancies
git submodule update --init --recursive

# Install
./install
```

## Other stuff that'll need to happen.

- Install zsh. `brew install zsh`, then add `$(which zsh)` to `/etc/shells`, then `chsh -s $(which zsh)`
- You'll probably be generating new ssh keys for this machine. Don't forget to also setup a [`config`](http://stackoverflow.com/questions/3466626/add-private-key-permanently-with-ssh-add-on-ubuntu)
- `plist` files are [cached](http://hints.macworld.com/article.php?story=20130908042828630), but linking should work either at startup or after killing the cashing process (`killall -u zak cfprefsd`)
