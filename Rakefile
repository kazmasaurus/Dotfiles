

require 'open3'

task :default => [:fish, :git, :vim, :fonts]

task :install => [:'meta:mackup', :default]

# Couple of things I'm still playing around with:
# - What's the order of operations?
#   There's at least some merrit to the idea that it should be Brewfile then install
#   Right now we can use the install to wrap shell scripts that need more complex functionality
# - Previously I had install > brewfile > setup
#   I think I want to avaid the setup though, because it makes it harder to see whats happening
#   And as far as I can tell, then only time install > brewfile is handy is if I need the install to install brew itself.
#   Which I don't think is ever necissary, because homebrew doesn't need to brew anything on it's own
#   So the stuff in that Brewfile can actually go in other brewfiles that go later.

# Config syncing

task :meta => [:dropbox, :homebrew] do
    sh 'brew bundle --file=stuff/Brewfile'
end

task :fish => [:'meta:homebrew', :'meta:dotbot'] do
    sh 'brew bundle --file=fish/Brewfile'
    sh 'meta/dotbot/bin/dotbot -d fish -c fish/install.conf.yaml'
end

task :git => [:'meta:homebrew', :'meta:dotbot'] do
    sh 'brew bundle --file=git/Brewfile'
    sh 'meta/dotbot/bin/dotbot -d git -c git/install.conf.yaml'
end

task :vim => [:'meta:homebrew', :'meta:dotbot'] do
    sh 'brew bundle --file=vim/Brewfile'
    sh 'meta/dotbot/bin/dotbot -d vim -c vim/install.conf.yaml'
end

task :fonts => [:'meta:dotbot'] do
    sh 'meta/dotbot/bin/dotbot -d fonts -c fonts/install.conf.yaml'
end

# This is more or less the setup process
namespace :meta do

    task :mackup => [:dropbox, :homebrew, :dotbot] do
        sh 'brew bundle --file=meta/mackup/Brewfile'
        sh 'meta/dotbot/bin/dotbot -d meta/mackup -c meta/mackup/install.conf.yaml'
    end

    task :dropbox => [:homebrew, :dotbot] do
        sh 'brew bundle --file=meta/dropbox/Brewfile'
        sh 'meta/dotbot/bin/dotbot -d meta/dropbox -c meta/dropbox/install.conf.yaml'
    end

    task :homebrew => :dotbot do
        # No brewfile, because we don't have homebrew installed yet ^_^
        sh 'meta/dotbot/bin/dotbot -d meta/homebrew -c meta/homebrew/install.conf.yaml'
    end

    # Underlying tool for scripting and linking
    task :dotbot do
        # Eventually I think I can replace dotbot with Open3.capture3 and sugar
        # of my own, but let's just get this going first.
        sh "git submodule update --init --recursive meta/dotbot"
    end
end


