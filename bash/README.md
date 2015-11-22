# Linux Server Setup


## SSH

### Server Setup
Install OpenSSH server:     
```bash
sudo apt-get install openssh-server
```

Edit `/etc/ssh/sshd_config` to permit root to login via SSH:
```
# Authentication:
LoginGraceTime 120
PermitRootLogin yes 
StrictModes yes
```

Restart the service:
```bash
sudo service ssh restart
```

Rename this server if necessary:
```bash
vim /etc/hostname
```

### Password-free Login

#### OS X : bash
```bash
REMOTESVR=192.168.158.136
ssh-keygen -t rsa -b 2048
scp ~/.ssh/id_rsa.pub root@"$REMOTESVR":/tmp/id_rsa.pub
ssh root@"$REMOTESVR" "mkdir ~/.ssh/; cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys"
```

#### Linux : bash
```bash
REMOTESVR=192.168.158.136
ssh-keygen -t rsa -b 2048
ssh-copy-id -i ~/.ssh/id_rsa.pub root@"$REMOTESVR"
```

#### Windows : cmder with msysgit
Install cmder: http://bliker.github.io/cmder/       
```bash
REMOTESVR=192.168.158.136
ssh-keygen -t rsa -b 2048
scp /c/Users/weye/.ssh/id_rsa.pub root@"$REMOTESVR":/tmp/id_rsa.pub
ssh root@"$REMOTESVR" "mkdir ~/.ssh/; cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys"
```



## Aliases

Append the following lines to `~/.bashrc` if it isn't there:
```bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

Overwrite local `~/.bash_aliases`:
```bash
curl -s https://raw.githubusercontent.com/vejuhust/dotfiles/master/bash/bash_aliases.sh > ~/.bash_aliases
```



## Install Tools

Consider mirror repositories in China, i.e. `vim /etc/apt/sources.list` -- e.g. [163](http://mirrors.163.com/.help/ubuntu.html)

### Utility
```bash
apt-get install --assume-yes --force-yes vim git screen zip unzip p7zip-full iftop vnstat fail2ban 
```

### Developer
```bash
apt-get install --assume-yes --force-yes gcc g++ build-essential python-dev python-pip python-setuptools python3-dev python3-pip python3-setuptools
```
