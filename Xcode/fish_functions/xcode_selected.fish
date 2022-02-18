function xcode_selected --description "Current Xcode (`xcode-select`)"
    xcode-select -p | cut -d'/' -f3
end
