# https://github.com/sharkdp/bat

function cat --wraps='bat' --description 'bat'
    # Dark mode hack from the README: https://github.com/sharkdp/bat#dark-mode
    bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub) $argv
end
