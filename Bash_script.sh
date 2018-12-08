    #!/bin/bash
    #
    # Made by H Power
    #
    # up- date/grade your current Debian system
    clear
    echo ""
    echo "Thanks for using this automated template script!"
    echo "This script is provided by Hpower inc."
    echo ""
    echo -n "Update and Upgrade System..."
    apt-get update -qq
    apt full-upgrade -qq
    echo "Done"
    #
    # set version to stretch and install
    # sed -i 's/jessie/stretch/g' /etc/apt/sources.list
    # apt-get update -qq
    # apt full-upgrade -qq
    echo -n "Install Programs..."
    apt-get install python-apt zsh git zsh-common fonts-powerline linuxlogo figlet vim lsb-release sudo dnsutils host whois telnet tmux lsof iputils-ping ipcalc ntp ntpdate mtr iperf -qq -y
    apt-get autoremove -y
    apt-get autoclean
    echo "Done"
    # Install ZSH
    git clone git://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/.oh-my-zsh
    #config ZSH
    echo -n "Configure ZSH..."
    cd /etc/zsh
    mv zshrc zshrc.backup
    wget -O zshrc https://raw.githubusercontent.com/MrHpower/debian/master/zshrc
    cd /etc/zsh
    rm -rf .dir_colors
    wget -O .dir_colors https://raw.githubusercontent.com/MrHpower/debian/master/.dir_colors
    cd /etc/zsh/.oh-my-zsh/themes/
    wget -O pdj.zsh-theme https://raw.githubusercontent.com/MrHpower/debian/master/pdj.zsh-theme
    cd ~
    autoload -U zsh-newuser-install
    echo "Done"
    #
    #Configuration of the banner:
    #
    #
    echo -n "Adding Banner..."
    rm -f /etc/motd
    ln -s -f /var/run/motd /etc/motd
    mkdir -p /etc/update-motd.d
    cd /etc/update-motd.d
    rm -rf *
    wget -O 00-header https://raw.githubusercontent.com/MrHpower/debian/master/00-header
    wget -O 10-sysinfo https://raw.githubusercontent.com/MrHpower/debian/master/10-sysinfo
    wget -O 20-updates https://raw.githubusercontent.com/MrHpower/debian/master/20-updates
    wget -O 99-footer https://raw.githubusercontent.com/MrHpower/debian/master/99-footer
    chmod 755 *
    echo "Done"
    # vimrc colorscheme
    echo -n "Configure vi(m)..."
    cd ~
    wget -O .vimrc https://raw.githubusercontent.com/MrHpower/debian/master/.vimrc
    chmod 644 .vimrc
    echo "Done"
    # Update repository with a cron job
    echo -n "Adding a cron job..."
    echo "0 * * * *	root	/usr/bin/apt-get update -qq" > /etc/cron.d/sys-updates
    echo "Done"
    # install SUDO
    echo -n "Installing SUDO..."
    apt-get install sudo -y
    cd /etc
    mv sudoers sudoers.backup
    wget -O sudoers https://raw.githubusercontent.com/MrHpower/debian/master/sudoers
    chown root:root /etc/sudoers
    chmod 440 /etc/sudoers
    /etc/init.d/sudo restart > /dev/null
    echo "Done"
    #ZSH config
    echo -n "Changing user shell (root) to ZSH..."
    usermod -s /usr/bin/zsh root > /dev/null 2>&1 /dev/null
    echo "Done"
    echo "Installation completed!"
    echo ""
