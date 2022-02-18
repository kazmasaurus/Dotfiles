function x --wraps open --description 'Open in Xcode (`xcode-select`ed)'
    open -a (xcode_selected) $argv
end
