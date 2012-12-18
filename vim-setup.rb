#!/usr/bin/ruby -w

user = "luilav"
source = "git://github.com/haridas/Dotfiles.git"
home = "/home/#{user}"
dotf = "#{home}/Dotfiles"

Dir.chdir "#{home}"

if !File.directory? dotf
    `git clone #{source}; cd #{dotf}; git submodule init; git submodule update`
else
    puts "Failed!"
end

#Created symlink for .vim directory
File.symlink("#{dotf}/vim-files/vim", "#{home}/.vim")

#Created symlink for .vimrc (this will override the /etc/vim/vimrc)
File.symlink("#{dotf}/vim-files/vim/vimrc", "#{home}/.vimrc")

#execute and compile command-t
Dir.chdir "#{dotf}/vim-files/vim/bundle/command-t/ruby/command-t"
system "ruby extconf.rb"
system "make"

puts "set-up done"


