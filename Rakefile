
task :default => [:fish, :git, :vim, :xcode, :fonts, :'apps']

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

# Dotbot now uses $SHELL for all it's execution, so we force `bash` so that we
#   have something that'll run on both existing and fresh machines.
dotbot = 'env SHELL=/bin/bash meta/dotbot/bin/dotbot'

task :fish => [:'meta:homebrew', :'meta:dotbot'] do
    brew_bundle('fish')
    sh "#{dotbot} -c fish/install.conf.yaml"
end

task :git => [:'meta:homebrew', :'meta:dotbot', :'fish'] do
    brew_bundle('git')
    sh "#{dotbot} -c git/install.conf.yaml"
end

task :vim => [:'meta:homebrew', :'meta:dotbot', :'fish'] do
    brew_bundle('vim')
    sh "#{dotbot} -c vim/install.conf.yaml"
end

task :xcode => [:'meta:dotbot', :'fish'] do
    brew_bundle('Xcode')
    sh "#{dotbot} -c Xcode/install.conf.yaml"
end

task :fonts => [:'meta:dotbot'] do
    sh "#{dotbot} -c fonts/install.conf.yaml"
end

task :'apps' => [:'meta:homebrew'] do
    brew_bundle('apps')
    sh "#{dotbot} -c apps/install.conf.yaml"
end

# This is more or less the setup process
namespace :meta do

    task :homebrew => :dotbot do
        # No brewfile, because we don't have homebrew installed yet ^_^
        sh "#{dotbot} -c meta/homebrew/install.conf.yaml"
    end

    # Underlying tool for scripting and linking
    task :dotbot do
        # Eventually I think I can replace dotbot with Open3.capture3 and sugar
        # of my own, but let's just get this going first.
        sh "git submodule update --init --recursive meta/dotbot"
    end
end

def brew_bundle(directory)
    # Bail early if this is a work account. Currently trying
    # https://www.codejam.info/2021/11/homebrew-multi-user.html
    # which assumes that brew setup has probably already happened
    return unless `whoami` == "me"

    puts "Brewing #{directory}"
    file = File.join(directory, "Brewfile")
    sh "brew bundle --file=#{file}", verbose: false
end


