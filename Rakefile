require 'rake'
require 'erb'

desc "un-install the dot files from the user's home directory"
task :uninstall do
  system %Q{unlink ~/.gitignore}
  system %Q{unlink ~/.gemrc}
  system %Q{unlink ~/.gvimrc}
  system %Q{unlink ~/.irbrc}
  system %Q{unlink ~/.vim}
  system %Q{unlink ~/.vimrc}
  system %Q{rm ~/.zshrc}
  system %Q{rm ~/.gitconfig}
  system %Q{rm -rf ~/.oh-my-zsh}
  system %Q{chsh -s /bin/bash}
  #system %Q{rm -rf ~/.dotfiles}
end

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - ["Rakefile", "README.rdoc", "README.md", "README.mkd", "LICENSE", "oh-my-zsh",
    "Default (OSX).sublime-keymap", "default.itermcolors", "Diablo IV - LocalPrefs.txt",
    "GitHub.tmTheme", "Oblivion.ini", "Preferences.sublime-settings", "Ruby.sublime-settings",
    "set-upstream.sh", "skyrim-special-edition-loot-mod-list.txt", "setup_osx", "Skyrim.ini",
    "SkyrimPrefs.ini", "userChrome.css", "vscode-settings.json"]
  #files << "oh-my-zsh/custom/plugins/jgrowl"
  #files << "oh-my-zsh/custom/jgrowl.zsh-theme"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  #elsif file =~ /zshrc$/ # copy zshrc instead of link
  #  puts "copying ~/.#{file}"
  #  system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
      link_oh_my_zsh_custom
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def link_oh_my_zsh_custom
    puts "linking .oh-my-zsh/custom"
    system %Q{mv "$HOME/.oh-my-zsh/custom" "$HOME/.oh-my-zsh/custom_bak"}
    system %Q{ln -s "$PWD/oh-my-zsh/custom" "$HOME/.oh-my-zsh/custom"}
end
