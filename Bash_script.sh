    #!/bin/bash
    #
    # Made by H Power
    #
    # up-date and grade your current Debian system
    apt-get update
    apt full-upgrade -y
    #
    # set version to stretch and install
    sed -i 's/jessie/stretch/g' /etc/apt/sources.list
    apt full-upgrade -y
    # Install ZSH
    apt-get install ZSH
    apt-get install git
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    apt-get install fonts-powerline
    #config ZSH
    cd /etc/zsh
    mv zshrc zshrc.backup
    wget -O zshrc https://raw.githubusercontent.com/MrHpower/debian/master/zshrc
    cd /etc/zsh
    rm -rf .dir_colors
    wget -O dir_colors https://github.com/MrHpower/debian/blob/master/.dir_colors
    cd /etc/zsh/.oh-my-zsh/themes/
    wget -O pdj.zsh-theme https://raw.githubusercontent.com/MrHpower/debian/master/pdj.zsh-theme
    cd ~
    autoload -U zsh-newuser-install
    ln -s /etc/zsh/zshrc
    chsh -s /usr/bin/zsh $USER
    #
    #Configuration of the banner:
    #
    #
    apt-get install linuxlogo -y
    cd /etc/update-motd.d
    rm -rf *
    wget -O 00-header https://raw.githubusercontent.com/MrHpower/debian/master/00-header
    wget -O 10-sysinfo https://raw.githubusercontent.com/MrHpower/debian/master/10-sysinfo
    wget -O 20-updates https://raw.githubusercontent.com/MrHpower/debian/master/20-updates
    wget -O 99-footer https://raw.githubusercontent.com/MrHpower/debian/master/99-footer
    chmod 755 *
    ZSH
    # install SUDO
    apt-get install sudo -y
    cd /etc
    sudo mv sudoers sudoers.backup
    sudo wget -O sudoers https://raw.githubusercontent.com/MrHpower/debian/master/sudoers
    sudo chmod 440 sudoers