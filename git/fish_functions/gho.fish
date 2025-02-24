function gho --wraps 'git log' --description 'Show git history (oneline)'
    git log --graph --oneline --decorate $argv
end

