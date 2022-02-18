# A Stripped down history showing how the current branch compares against development
function ghs --wraps 'gh'
    gh --first-parent --boundary --simplify-by-decoration development... $argv
end
