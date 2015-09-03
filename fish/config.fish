
# Wrap hub in `git`
eval (hub alias -s)

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
