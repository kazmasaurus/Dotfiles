
# Wrap hub in `git`
eval (hub alias -s)

# Git aliases
alias ga 'git add'
alias gc 'git commit'
alias gd 'git diff'
alias gdd 'git difftool'
alias gg 'git status'
alias gh 'git log --graph --oneline --decorate'

# Xcode aliases
alias x 'open . -a "Xcode"'
alias xb 'open . -a "Xcode-beta"'
alias xo 'open . -a "Xcode-old-shit"'

# Easy vim
alias nim 'open -a Neovim'
alias mim 'mvim'

# Muscle memory dies hard
alias mate 'mvim'

# Path party
set PATH "/usr/local/sbin" $PATH

# Thanks Schwa! https://gist.github.com/schwa/92413257ccca89766493
function xcode-toggle \
    -d "Toggles the version Xcode that xcode-build points to."

	if xcode-select -p | grep -i beta > /dev/null
		echo "Using beta. Switching to release."
		sudo xcode-select -s /Applications/Xcode.app
	else
		echo "Using release. Switching to beta."
		sudo xcode-select -s /Applications/Xcode-beta.app
	end
	xcode-select -p
end
