
# A Stripped down history showing how the current branch compares against development
function ghs
    gh --first-parent --boundary --simplify-by-decoration development... $argv
end
