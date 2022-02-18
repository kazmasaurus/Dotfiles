function gpu --wraps 'git push' --description 'git push to origin with current branch name'
    git push -u origin HEAD $argv
end
