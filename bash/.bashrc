# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

#set history size
export HISTSIZE=2000
export HISTFILESIZE=2000
##save history after logout
export SAVEHIST=2000

alias auth='f(){ aws-google-auth -p "$1" -d 3500; unset -f f; }; f'
alias ssm='f(){ aws ssm start-session --target "$1"; unset -f f; }; f'
alias instance='f(){ awless list instances --tag Name="$1"; unset -f f; }; f'
alias profile='f(){ export AWS_PROFILE="$1"; unset -f f; }; f'
alias assume='f(){ auth "$1" && profile "$1"; unset -f f; }; f'
alias ssh="kitty +kitten ssh"

export PATH="$HOME/opt/cross/bin:/home/david/.cargo/bin:/usr/local/opt/llvm/bin:/usr/local/opt/gnu-getopt/bin:${PATH}"
export AIRFLOW_HOME=/Users/david/airflow2
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export VISUAL=vim
export EDITOR="$VISUAL"
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
export PUPPETEER_EXECUTABLE_PATH=/home/david/.npm-global/lib/node_modules/puppeteer/.local-chromium/linux-901912/chrome-linux/chrome


unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
