

require 'open3'

task :dotbot do
    # Eventually I think I can replace dotbot with Open3.capture3 and sugar
    # of my own, but let's just get this going first.
    sh "git submodule update --init --recursive dotbot"
end

task :homebrew => :dotbot do
    sh 'dotbot/bin/dotbot -d homebrew -c homebrew/install.conf.yaml'
end

