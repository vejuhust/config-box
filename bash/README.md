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
REMOTESVR=192.168.158.132
ssh-keygen -t rsa -b 2048
scp ~/.ssh/id_rsa.pub root@"$REMOTESVR":/tmp/id_rsa.pub
ssh root@"$REMOTESVR" "mkdir ~/.ssh/; cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys"
```

#### Linux : bash
```bash
REMOTESVR=192.168.158.132
ssh-keygen -t rsa -b 2048
ssh-copy-id -i ~/.ssh/id_rsa.pub root@"$REMOTESVR"
```

#### Windows : cmder with msysgit
Install cmder: http://bliker.github.io/cmder/       
```bash
REMOTESVR=192.168.158.132
ssh-keygen -t rsa -b 2048
scp /c/Users/weye/.ssh/id_rsa.pub root@"$REMOTESVR":/tmp/id_rsa.pub
ssh root@"$REMOTESVR" "mkdir ~/.ssh/; cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys"
```


## Install Tools

### Utility
```bash
apt-get install --assume-yes --force-yes vim git screen unzip p7zip-full iftop vnstat fail2ban 
```

### Developer
```bash
apt-get install --assume-yes --force-yes gcc g++ build-essential python-dev python-pip python-setuptools
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

