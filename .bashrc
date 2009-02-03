# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If running interactively, then:
if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases

	eval `dircolors -b`
	alias ls='ls -F --color=auto'
	alias netstat='netstat -n'
	alias grep='grep --color=auto'
	alias ul='/opt/scripts/s3/s3sync.rb -r -v --exclude=".*.(php|swp)" --progress mymiler.com: /opt/repos/mymiler.com/'
	alias ur='/opt/scripts/s3/s3sync.rb -r -p -v --exclude=".*.(php|swp)" --progress /opt/repos/mymiler.com/ mymiler.com:'
	export PYTHONPATH=$PYTHONPATH:~/gdata/lib/python/gdata
	export EDITOR=vim
	export TERM=xterm
	export TZ=EDT
	if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi

	PS1="[\t \u@\h:\w]$ "

    export MYSQL_PS1="\R:\m:\s (\c) > "

fi

export TZ="/usr/share/zoneinfo/America/Louisville"
