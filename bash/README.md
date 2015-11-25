# Bash Settings


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
