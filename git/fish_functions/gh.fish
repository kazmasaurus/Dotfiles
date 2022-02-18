function gh --wraps 'git log' --description 'Show git history'
    git log --graph --oneline --decorate $argv
end

