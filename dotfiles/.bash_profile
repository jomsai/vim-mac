##================MacOS .bash_profile====================##
##=====================Prompt===========================##
PS1="[$(tput bold)\]\[$(tput setaf 3)\]\t";
PS1+="\[$(tput setaf 2)\][\[$(tput setaf 4)\] \u ";
PS1+="\[$(tput setaf 1)\]]==> ";
PS1+="\[$(tput setaf 3)\]\h ";
PS1+="\[$(tput setaf 6)\] \W ]";
PS1+="\[$(tput bold)\]\[$(tput setaf 2)\][ $?! ]";
PS1+="\[$(tput setaf 4)\][[>";
PS1+="\[$(tput setaf 1)\]\\$ ";
PS1+="\[$(tput sgr0)\]";
export PS1;

SEP=##=============================================##
##=====================ENV=========================##
alias env2='export -p'  #List of all Shell VAR declared
alias env='printenv'   #Same as above via another command. Shows _ VAR
alias bashv="/usr/local/bin/bash --version | grep darwin | cut -c 19-35"
alias less='less -FSRXc'  # Preferred 'less' implementation
alias path='echo -e ${PATH//:/\\n}'  # path: Echo all executable Paths
alias shopt='shopt'   # Show_options: display bash options settings
alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'

PATH=$HOME/bin:$PATH
VIM=/usr/local/bin/vim
#VIM=/usr/local/Cellar/vim/*/bin/vim
#PATH=/usr/local/Cellar/vim/*/bin/vim:$PATH  #Where Vim 8.0 is
PATH=/usr/local/bin/vim:$PATH  #Where Vim 8.0 is
PATH=/usr/local/bin/python3:$PATH   #Where Py3 is
PATH=/usr/local/Cellar/gcc/6.3.0_1/bin/gcc-6:$PATH   #If needed for linter-gcc in Atom Editor
#VIM=/usr/bin/vim
VISUAL=/usr/local/bin/vim; export VISUAL
#VISUAL=/usr/bin/vim; export VISUAL
EDITOR=/usr/local/bin/vim; export EDITOR
#EDITOR=/usr/bin/vim; export EDITOR
PAGER=/usr/bin/less; export PAGER
SHELL=/usr/local/bin/bash

alias vi=vim
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vimrc'

set -o vi  # in terminal hit ESC and long commands are then editable vi style
#set -o history
export HISTFILESIZE=50000
export HISTSIZE=30000
export HISTCONTROL=erasedups:ignoredups:ignorespace
#export HISTIGNORE=
#export HISTFILE=~/.bash_history_forensic
#export HISTTIMEFORMAT="%F-%R "  # Forensic useful timestamp
shopt -s checkwinsize  #update winsize if needed
shopt -s histappend   #try to list long commands on 1 line
#PROMPT_COMMAND='history -a'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-color"
export TERM="xterm-256color"
##=============< cd >==< ls >==< less >=========##
cd() { builtin cd "$@" && ls -FGlAhpi ; }
alias cdb="cd -"
alias ..='cd ..'                # Go back 1 directory level
alias ...='cd ../..'             # Go back 2 directory levels
alias ....='cd ../../../'          # Go back 3 directory levels
alias .....='cd ../../../../'       # Go back 4 directory levels
alias ......='cd ../../../../../'    # Go back 5 directory levels

# No more cd ../../../
up() {
	local d=""
	limit=$1
	for ((i=1; i<=limit; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

##=============== ls Aliases ==================##
alias ls='ls -Fhail'  ## my long-all ls with inodes human attr/@*|=% 
alias lss='\ls -al | less'  ## ls piped to less
alias lsn='ls -n'  ## No Resolution of UID and PID to names
alias lsza='\ls -r'  ## REVERSE Alphabetcial ls
alias lswc='\ls -al | wc -l'  ## ls items Word Count
alias ld='\ls -d */' ## DIR only ls
alias l.='ls -ld .*'  ## Dotfiles only ls
alias lsz='\ls -Shail'  ## Size Sort ls
alias lszr='\ls -Shailr'  ## Size Sort ls in REVERSE
alias lt='\ls -thail'  ## Time Sort ls
alias ltr='\ls -thailr'  ## Time Sort ls in REVERSE
alias lta='\ls -uhalnr'  ## Time Sort ls by ACCESS Time,so best to have ARG1=<somefile>
alias ltm='\ls -thalnr'  ## Time Sort by Modification (default ls), so best with ARG1=<somefile>
alias ltm2='\ls -thalnr | tail -n1'  ## Time Sort by Modification & pick the last 1 modified in the DIR
alias ltb='\ls -Uhalnr'  ## Time Sort by BIRTH Time (btime)
##=========Edit Source Backup Dotfiles==========##
alias so='source ~/.bash_profile && \cp ~/.bash_profile ~/.bash_profile.bak && \cp ~/.bash_profile ~/gitHub/vim-mac/dotfiles/BASHPROFILE_MacOS_Aliases_$(date "+%Y-%m-%d_%H%M%S").txt && echo "Yeah Baby!"'
alias sovim='\cp ~/.vimrc ~/.vimrc.bak && \cp ~/.vimrc ~/github/vim-mac/dotfiles/VIMRC.$(date "+%b_%d_%Y_%H.%M.%S").txt && echo "Whatttyyyaaaaa"'
alias sotmux='\cp ~/.tmux.conf ~/.tmux.conf.bak && \cp ~/.tmux.conf ~/github/vim-mac/dotfiles/TMUXCONF_MacOS.$(date "+%b_%d_%Y_%H.%M.%S").txt'
alias tmux3='tmux && tmux split-window -v -l 30 && tmux split-window -h'
alias tmuxhh='tmux split-window -h -p 50'
alias ebrc="vim ~/.bash_profile"  # Quick access to the file in Vim
alias evimrc="vim ~/.vimrc"
alias etmux='vim ~/.tmux.conf' 
##=================MISC=========================##
alias brewperms='sudo chown -R $(whoami) $(brew --prefix)/*'  #Resets screwed up brew permissions
alias brewupgrade='brew update && brew upgrade'
alias c='clear'
alias condaupdate='conda update conda'  # Updates packages in Miniconda or Conda
alias cx='chmod a+x' # Requires ARG e.g. $ cx *.txt etc
alias chrome="open -a \"Google Chrome\""
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias clamtest='wget http://www.eicar.org/download/eicar.com -O ~/eicar.com'
alias wipefree='sudo diskutil secureErase freespace 0' # ARG1=PathToExtHD e.g. /Volumes/xxx\ Ext\ Drive
alias h='history 40'
alias j='jobs -l'
#alias joff="kill $(jobs -l | awk '/Stopped/{print $3}')"
alias joff="kill $(\jobs -l | grep Stopped | cut -d' ' -f3)"
alias rm='rm -ivP' # -i is interactive -P is wipe 3 times 1s then 0s then 1s
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\"" ; }
alias pi='echo $(echo "scale=50; 4*a(1)" | bc -l)'
alias pubkey='wget keybase.io/leokwa/private/leokwa/mascpar.public.gpg.asc'
alias catread='cat ./README'
alias spk1='say "What the hell do you want from me"'
alias spk2='say "after a while ya just see blonde und brunette" && cmatrix'
alias cpwd='pwd|tr -d "\n"|pbcopy'
function yt() { sudo youtube-dl -U && youtube-dl -cit -f mp4 "$1" ; }
#alias ckgy='vlc rtsp://newcap-RedDeer-CKGY.wm.llnwd.net/newcap_RedDeer-CKGY' # Country Radio?
alias macupdate='sudo softwareupdate --install --all'
alias macxcodetools='xcode-select --install'  # Installs Xcode SelectTools
alias todo="echo $2 \`date +%FT%R\` >> ~/Documents/todo.log"
##=======Random Functions for PW generation (2 are Linux Only)=======##
randpw() { openssl rand -base64 45 ; }
randpw2(){ </dev/urandom tr -dc '12345!@#_$-%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c14; echo "";}
randpw3(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;}

count() { python -c "for num in xrange($1):print num" ; }  #count0-ARG down screen
psman() { man -t "${1}" | open -f -a /Applications/Preview.app/ ; }  #Open ManPage in Preview
ql () { qlmanage -p "$*" >& /dev/null; }  # Quicklook any file in Preview
##================Networking====================##
alias p3='ping -c 3 -s 1 8.8.8.8'
alias p1='scutil -r ${intip} 8.8.8.8'  # simple ping reachable?
alias fastping='ping -c 100 -s.2'
alias dnsping="scutil --dns | tail -n1 | cut -c 26-35" #MacOS Reachable or Not Reachable
alias host='sysctl -a | grep hostname | cut -d ":" -f2 | cut -c 2-10'

alias ipcfg="nface | xargs ipconfig getpacket"  #ARG before COMMAND with xargs
alias routes='netstat -r'
alias tcp='netstat -anp tcp'
alias udp='netstat -anp udp'
alias ports="sudo lsof -i | grep LISTEN && netstat -an | grep LISTEN"  #ports: listen connections x2
alias listen='netstat -anp tcp | grep LISTEN'  # listen: All listen connections
alias listenapps='/usr/libexec/ApplicationFirewall/socketfilterfw --listapps'  # Suggested to be < 10
alias sock='lsof -i'  #All open TCP/IP Sockets
alias loop='netstat -anp tcp | grep 127.0.0.1'  # Loopback interface tcp stats
alias nface="scutil --nwi | grep interfaces: | cut -c 21-23"  #LINUX  netstat -r | grep default | awk '{print $8}'
alias intip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias intips="ifconfig $nface | grep inet | cut -d ' ' -f2"  #inet4 & inet6 intIP
alias extip='curl ifconfig.io'
alias extip2='curl ipinfo.io'  # Takes ARG=any IP or if no ARG does local ext IP
alias extip3="dig +short myip.opendns.com @resolver1.opendns.com"
alias extip4="curl icanhazip.com"  #site curl ip.appspot.com is unreliable 
alias macch='sudo macchanger -r en4'
alias geoip='curl ipinfo.io/"$1"'
#geoip2() { read ip; curl ipinfo.io/$ip; }  #Alternative to read in the IP
##===============PF Firewall====================##
alias pfedit='sudo vim /etc/pf.conf'  # Edit the config file for PFD Firewall
alias pfinfo='sudo pfctl -v -si'
alias pfstates='sudo pfctl -v -ss'
alias pfrules='sudo pfctl -v -sr'
alias pfall='sudo pfctl -v -sa'
alias pfall2='sudo pfctl -v -sa | less'
alias pfload='sudo pfctl -f /etc/pf.conf'
alias pftest='sudo ofctl -v -n -f /etc/pf.conf' # Tests any changes you make for analysis before loading
alias pfenable='sudo pfctl -e'
alias pfdisable='sudo pfctl -d'
alias pfverbose='sudo pfctl -v' # Sets output to Verbose Mode but can also be used with other commands
alias pfappfwrules='sudo pfctl -a com.apple/250.ApplicationFirewall -s rules' #  -a=Anchors -Unless stealth on there will be none!
alias pfmyrules='sudo pfctl -a /ron.org.pf -s rules' # -a=Anchors -Here are my rules in /etc/pf.anchors/ron.org.pf
alias pfappfwload='sudo launchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist && sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist'
#alias pfappfwunload='sudo launchctl unload /System/Library/LaunchAgents/com.apple.alf.useragent.plist && sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist'

##===============SSH Aliases====================##
alias server_name='ssh -v -l USERNAME IP ADDRESS'
alias sshagent='ls /System/Library/LaunchAgents | grep ssh'
alias sshrsakey='ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_mozilla_$(date +%Y-%m-%d) -C "Mozilla key for $USER"'
alias sshed255key='ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_mozilla_$(date +%Y-%m-%d) -C "Mozilla key for $USER"'
alias sshgit='ssh -Tv -i ~/.ssh/id_rsa_mozilla_2017-12-20 git@github.com'  #-T stops pseudoterminal warning
alias sshkeys='ssh-keygen -lv -f ~/.ssh/id_rsa.pub && ssh-add -l'
alias sshkeyed='eval `ssh-agent` && sudo ssh-add ~/.ssh/id_ed25519_mozilla_2017-12-20 && sudo ssh-add -l && sudo ssh-agent -s && echo "ssh agent on so go"'
alias sshkeyrsa='eval `ssh-agent` && sudo ssh-add ~/.ssh/id_rsa_mozilla_2017-12-20 && sudo ssh-add -l && sudo ssh-agent -s && echo "ssh agent on so go"'
alias sshkeychainadd='/usr/bin/ssh-add -K ~/.ssh/id_ed25519' # ARG1 identity key
alias sshpid='ps -e | grep ssh-agent | cut -d " " -f1'  #PID of ssh service so I can whack it
#alias sshpid='ps -e | grep ssh-agent | cut -d " " -f1 && sudo killall ssh-agent && '  #Need a restart method
alias sshasus='ssh -vvi ~/.ssh/id_ed25519_asus root@192.168.1.1'
alias sshaws='ssh -i ~/.ssh/id_rsa_mozilla_2017-12-20 root@bulot.tklapp.com'
alias sshfedora='ssh -i id_rsa jus@192.168.1.115 -vv'
alias sshfedora2='ssh -i id_ed25519 jus@192.168.1.115 -vv'
function sshciphers() { 
	ssh -Q cipher && echo $SEP
	ssh -Q cipher-auth && echo $SEP
	ssh -Q mac && echo $SEP
	ssh -Q kex && echo $SEP
	ssh -Q key && echo "##====>The END====##";

}
##===============Processes======================##
alias cpuboot='sysctl kern.boottime | cut -d "}" -f2 | cut -c 2-26'
alias cpuendian='sysctl hw.byteorder | cut -d ":" -f2 | cut -c 2-6 && printf " ==>Little Endian=1234"'
alias cpucores='sysctl machdep.cpu.core_count'
alias cpuhog='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias cpumodel='sysctl machdep.cpu.brand_string | cut -d ":" -f2 | cut -c 2-44'
alias cpustats='iostat'
alias flush="sudo killall -HUP mDNSResponder"
alias free='/opt/pkg/bin/free'  #Kid get yaself a system
alias hd="tail -n 35 /var/log/daily.out | grep /dev/disk1 | awk {'print \$5'}"  #Mac HD Avail Space
alias df='df -ha $HOME' # Human readable Home DIR only with mountpoints
alias duhome='du -chd 1 | grep -i total'  # Size Home DIR in GB
alias duhome2='du -chd 1'  # Size Home DIRs in GB

myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
findPid () { lsof -t -c c "$@" ; }
alias memhogtop='\top -l 1 -o rsize | head -20'
alias memhogps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias memswap='sysctl vm.swapusage | cut -d ":" -f2 | cut -c 2-62'
alias psname="ps -o comm= -p $1"   # ARG is PID and will tell you the Name of the Process
alias services='launchctl list'
alias servicefind='launchctl list | grep'  #Needs 1 ARG like ssh-agent,
alias top='htop'
alias ttop='\top -R -F -s 10 -o rsize'  # Low Resource Top

#    Hosts file info
ii()
{
	printf "${BlackYellowBG}You are logged on ${USER}${GREEN}" ; dig | tail -n4
	printf "${CYAN}Current date : $NC" ; date
	printf "${BROWN}Machine stats :" ; uptime
	printf "${CYAN}ACTIVE Interface on my Mac==> " ;  nface
	printf "Public facing IP Address ==> " ; extip
	printf "IP Reachable or not? ==> " ; scutil -r ${intip} 8.8.8.8
	printf "My Internal IP==> " ; ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
	printf "${GreenBrownBG}DNS Configuration:" ; scutil --dns | head -n 12
	echo -e "\n${GreenBrownBG}Additionnal information:" ; uname -a | xargs -n 7
	echo -e "\n${PURPLE}Users logged on:" ; w
	echo -e "\n${GREEN}CPU Stats: " ; iostat
	echo -e "\n${CYAN}Disk Usage:" ; df -h $HOME
	echo
}

##===================Search=====================##
alias fhere="find . -name"
alias ff='find . -name $1'
alias findinode='sudo find . -inum' # Needs ARG1=inode number

spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; } #Mac spotlight metadata search
##==================Security====================##
alias ax="chmod 700"  ## Make executable by me only
alias flushDNS='dscacheutil -flushcache' # flushDNS: Flush out the DNS Cache
alias logdump='sudo find / -maxdepth 4 -type f -iname "*log" -print0 | xargs -0 ls -ltrh >> /tmp/log_daily.txt && sudo tail -n7 /private/var/log/fsck_hfs.log'
function logknock2() { log show --predicate 'eventMessage contains "OBJECTIVE-SEE ERROR"' --info ; }
alias nixrtkt='sudo ./chkrootkit'
alias sha1='openssl dgst -sha1 '
alias sha256='openssl dgst -sha256'
alias sha512='openssl dgst -sha512'
alias shamd5='openssl dgst -md5'
alias shawp='openssl dgst -whirlpool'
alias sudo='sudo '
alias sbb='sudo $(fc -ln -1)'  # sudo !! shortcut
alias securekeyboard='defaults read -app Terminal SecureKeyboardEntry' # 1 means other apps cannot read the Terminal
alias javaquery='java -version' # Is Java installed. If not this causes app to ask if you want it. Just say no
alias locationon='sudo launchctl load /System/Library/LaunchDaemons/com.apple.locationd.plist'
alias locationoff='sudo launchctl unload /System/Library/LaunchDaemons/com.apple.locationd.plist'
alias permapps='sudo find /Applications -iname "*\.app" -type d -perm -2 -ls' # Make sure no worldwriteable apps
alias permpublic='sudo find /System -type d -perm -2 -ls | grep -v "Public/Drop Box"' # Make sure Public DIR not WWriteable
alias permcache='sudo find /Library -type d -perm -2 -ls | grep -v Caches' # Make sure Lib/Cache not WWriteable
alias keychaininfo='security show-keychain-info'  # Lock-on-sleep and a timeout should be there

##OpesnSSL encrypt Message Fx takes <name>.txt file ARG anywhere & places .dat file on Desktop & dencit decrypts to Desktop
function encit() { openssl enc -aes-256-cbc -in $@ -out ~/Desktop/$@.dat; }
function dencit() { openssl enc -aes-256-cbc -d -in ~/Desktop/$@.dat > ~/Desktop/$@; }
alias osslprivkey='openssl genrsa -out private.pem $@' #ARG1=BinSize e.g. 2048
alias osslparse='openssl asn1parse -in $@' #ARG1=.pem file made by osslkey
alias osslpubkey='openssl rsa -in private.pem -outform PEM -pubout -out public.pem'
alias osslkeys='openssl genrsa -out private.pem 4096 && openssl rsa -in private.pem -outform PEM -pubout -out public.pem' #4096bit PEM Key Pair

alias cryptin='ccrypt -e $@' # ARG= any file
alias cryptout='ccrypt -d $@' # ARG= any file.cpt encrypted file

# tcpdump aliases use -I to turn on Monitor Mode only for WiFi Interface
tdump () { sudo tcpdump -i $(nface) -pnnvvveXXSs 1514 -c2000 -w /tmp/tdump2k.pcapng ; }
tdumpwifi () { sudo tcpdump -i $(nface) -IpnnvvveXXSs 1514 -c2000 -w /tmp/tdump2k.pcapng ; }
tdumpping () { sudo tcpdump -i $(nface) -IpennvXXSs 1514 icmp -c20 -w /tmp/tdumpping.pcapng ; }
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}  #$sanitize file/DIR Permissions

##===========Pkgsrc Package Manager=============##
#alias pkginstall='sudo pkgin install'
#alias pkgfind='sudo \pkgin avail | grep '
#alias pkglocal='pkgin list'  # All local packages installed
#alias pkgrepo='sudo pkgin avail > /Users/ron/Documents/pkgin_installed.txt'
#alias pkgupdate='sudo pkgin -y update && sudo pkgin -y full-upgrade'
#alias pkgsearch='sudo pkgin search' # ARG1=search term

##================Github========================##
alias ga='git add -A'  #ga: Git add all files
alias gs='git status'  #gs: Git status
alias gc='git commit -m'  #gc: Git commit w/ message
alias gcl='git clone'
alias gf='git fetch'
alias gpu='git pull'  #gpu: Git pull
alias gp='git push'  #gp: Git pushi # Asks for user & pw but use token not pw
alias gr='git revert HEAD'  #gr: Git revert HEAD
alias gittar='tar cjvf ~/Desktop/github_mac.tbz ~/github'
alias gd="git diff --color"	#gd: Git diff in color
alias gt="git today --since='1 day ago'"	#gt:	Git last 24 hours
alias gl="git log --pretty=format:'%h %ad | %s [%an]' --graph --since='30 days ago' --color"
alias gogit='cd ~/github/vim-mac/dotfiles && gs'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gitdelete='git add -u . && git commit -m "removing deleted files from tracking" && git push origin master'
# NOTE: hist alias in .gitconfig used as git hist gives a pretty=format history
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
alias gitjustify='git remote set-url origin git@github.com:jomsai/Vim-rep.git' #Stops git push asking for password 
alias gitls='git config --list'  # Shows all the options set in ~/.fitconfig file
#ssh://git@github.com/jomsai/Vim-rep.git
#https://github.com/jomsai/Vim-rep.git
#git config credential.helper store

alias dversion='docker --version && docker-compose --version && docker-machine --version && docker version'
##=============Keybase.IO Aliases===============##

alias keydir='sudo open /keybase/private/leokwa'



##===============Message Center=================##
#== echo -e for ESC, \033 works > \e on MacOS====#
#== quoting () works but also generate error
#echo -e "ALERT *\\*/ ${PURPLE}${WBG}MOTD${NC}"  #Message in Purple on Yellow
echo -e "${RED}${YBG}BASH Version $(which bash --version) - for $USER${NC}"
#echo -e "MOTD \033[107;38;5;199m Fuhgettaboutit \033[33;48;5;52m Semper fi $NC"
#echo -e "$GreenBrownBG Conf in 10 minutes NOT MANDATORY... Free Cookies! $NC"
#echo -e "${BlackYellowBG} Welcome to a new day! ${NC}"
#echo -e "${bldgrn}Green tput ${bldmag}MOTD${txtrst}"
#echo "$bldgrn Help me I am out of Oreos! $txtrst"
#echo "${bldmag} Party at the Boss House 7PM! ${txtrst}"
#echo "${reverse} Reverse Current FGBG Text MOTD${txtrst}"
#printf '\e[38;5;222;48;5;238m  Hi  \e[0m\n'

# Server will SHUTDOWN Message function using tput 6 or CYAN
gohome()
{
	tput setaf 6; echo "The Server will SHUTDOWN in 15 minutes so SAVE and go home"
}
##============END Message Center================##
##============Archive Aliases Functions=========##
alias mktar='tar -cvf'  ##ARG1=path/file ARG2= files to package
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
zipf () { zip -r "$1".zip "$1" ; }  # zipf:Create a ZIP archive of a folder

# extract function for any Archive Compression Type
extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     	 echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
             echo "'$1' is not a valid file"
        fi
}

##=================Colors MISC==================##
#colors below=>osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# 2 Color choices to Terminal NOW it works great!

# Simple Color Settings
BLACK='\033[0;30m'  #0;30=Lt,1;32=Dk
RED='\033[0;31m'  #0;31=Lt,1;31=Dk
GREEN='\033[0;32m' #0;32=Lt,1;32=Dk '\033[1;32m'
BROWN='\033[0;33m'  #0;33=Brown,1;33=Bright YELLOW
BLUE='\033[0;34m'  #0;34=Lt,1;34=Dk
PURPLE='\033[0;35m'  #0;35=Lt,1;35=Dk
CYAN='\033[0;36m'  #0;36=Lt,1;36=Dk
WHITE='\033[1;37m'  #0;37=Lt Gray but 1:37=White

# Some BOLD Color Settings
BOLDBLACK='\033[1;30m'  #0;30=Lt,1;32=Dk
BOLDRED='\033[1;31m'  #0;31=Lt,1;31=Dk
BOLDGREEN='\033[1;32m' #0;32=Lt,1;32=Dk '\033[1;32m'
BOLDYELLOW='\033[1;33m'  #0;33=Brown,1;33=Bright YELLOW
BOLDBLUE='\033[1;34m'  #0;34=Lt,1;34=Dk
BOLDPURPLE='\033[1;35m'  #0;35=Lt,1;35=Dk
BOLDCYAN='\033[1;36m'  #0;36=Lt,1;36=Dk

# Simple Color Backgrounds
BlackBG='\033[40m'
RBG='\033[41m'
GBG='\033[42m'
YBG='\033[43m'
BlueBG='\033[44m'
PBG='\033[45m'
CBG='\033[46m'
WBG='\033[47m'

print8fgcolors() { printf '\e[%sm▒' {30..37} 0; echo ; }
print8bgcolors() { printf '\e[%sm ' {40..47} 0; echo ; }

# This function echoes 8 COLORS and codes to check your display
print8colors()
{
	echo -e "\n\033[4;31mLight Colors\033[0m  \t\t\033[1;4;31mDark Colors\033[0m"
	echo -e "\033[0;30;47m Black    \033[0m 0;30m \t\033[1;30;40m Dark Gray  \033[0m 1;30m"
	echo -e "\033[0;31;47m Red      \033[0m 0;31m \t\033[1;31;40m Dark Red   \033[0m 1;31m"
	echo -e "\033[0;32;47m Green    \033[0m 0;32m \t\033[1;32;40m Dark Green \033[0m 1;32m"
	echo -e "\033[0;33;47m Brown    \033[0m 0;33m \t\033[1;33;40m Yellow     \033[0m 1;33m"
	echo -e "\033[0;34;47m Blue     \033[0m 0;34m \t\033[1;34;40m Dark Blue  \033[0m 1;34m"
	echo -e "\033[0;35;47m Magenta  \033[0m 0;35m \t\033[1;35;40m DarkMagenta\033[0m 1;35m"
	echo -e "\033[0;36;47m Cyan     \033[0m 0;36m \t\033[1;36;40m Dark Cyan  \033[0m 1;36m"
	echo -e "\033[0;37;47m LightGray\033[0m 0;37m \t\033[1;37;40m White      \033[0m 1;37m"
}

# 16 COLOR Function --NOTE can crash terminator
print16colors()
{
for clbg in {40..47} {100..107} 49 ; do
	#Foreground
	for clfg in {30..37} {90..97} 39 ; do
		#Formatting
		for attr in 0 1 2 4 5 7 ; do
			#Print the result
			echo -en "\033[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \033[0m"
		done
		echo #Newline
	done
done
exit 0
}

#Samples function for 256 COLOR formatting
print256colors() { printf '\e[48;5;%dm ' {0..255}; printf '\e[0m \n' ; }

# 256 COLOR function2 with for loop and tput
print256colors2()
{
color()
{ 
	for c; do
		printf '\e[48;5;%dm%03d' $c $c
		done
		printf '\e[0m \n'
}
IFS=$' \t\n'
color {0..15}
for ((i=0;i<6;i++)); do
	color $(seq $((i*36+16)) $((i*36+51)))
done
color {232..255}
}

# 16 million COLOR Test Function that works
print16millcolors() { fb=3;r=255;g=1;b=1;printf '\033[0;%s8;2;%s;%s;%sm▒▒▒ ' "$fb" "$r" "$g" "$b" ; }
# OK 16 Million COLORS also but does not work
print16millcolors2() { for r in {200..255..5}; do fb=4;g=1;b=1;printf '\033[0;%s8;2;%s;%s;%sm    ' "$fb" "$r" "$g" "$b"; done ; }

# Mixed Colors -BOLD element1 Easy to  REV FGBG change 1 to 7
WhiteGrayBG='\033[1;47;88m'
GreenBrownBG='\033[1;100;92m'
BlackYellowBG='\033[1;103;30m' 
CyanGrayBG='\033[1;107;36m'
BlackGreenBG='\033[1;102;30m'
YellowMaroonBG='\033[1;88;226m'  # Yellow Text MaroonBG 256 Colors
NC="\033[0m"  # NO COLOR RESET back to Default
BLINK='\033[5;32;47m'  #Blinking GreenFG on GrayBG

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\033[01;31m'
export LESS_TERMCAP_md=$'\033[01;31m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;32m'

# tput SETAF Text 8 color variables
txtund=$(tput sgr 0 1)  # Underline
txtbld=$(tput bold)   # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldyel=${txtbld}$(tput setaf 3) #  yellow
bldblu=${txtbld}$(tput setaf 4) #  blue
bldmag=${txtbld}$(tput setaf 5) #  magenta
bldcyn=${txtbld}$(tput setaf 6) #  cyan
bldwht=${txtbld}$(tput setaf 7) #  white
reverse=${txtbld}$(tput rev) 	# reverse FGBG
txtrst=$(tput sgr0)   			# Reset
info=${bldwht}*${txtrst}   		# Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

##=====Settings To Be AT END of the Dotfile=====##
##=============Things to remember===============##
#alias yubiauth='sudo sed '5 i "auth       required       /usr/local/lib/security/pam_yubico.so mode=challenge-response" /etc/pam.d/authorization' # Put on 5th line before
#alias yubiscreensaver='sudo sed '4 i "auth       required       /usr/local/lib/security/pam_yubico.so mode=challenge-response" /etc/pam.d/screensaver' # Put on 4th line
#alias yubisudo="sudo sed '1 i auth       sufficient     pam_yubico.so mode=challenge-response debug' /etc/pam.d/sudo"  #Must be on line 1 of the sudo file 
#Sample color off/on SYNTAX "\033[fg;bgm\] symbolic \[\033[0m\]"
#2 Many make DIR then cd into them on the net but not needed as already builtin
#Setting PATH for Python 3.5
#The original version is saved in .bash_profile.pysave
#Remove a file ARG1 by its inode
#alias rminode='find . -inum "$1" -exec rm {} \;'
#rminode () { find . -inum "$1" -exec rm {} + ; }
# Make an ISO OS File an isohybrid
#hdiutil convert -format UDRW -o /path/to/target.img /path/to/source.iso
# Backup a file with date eg cp file file.$(date "+%b_%d_%Y_%H.%M.%S").txt ==> file.Oct_16_2017_13.50.13.txt
# Backup file.txt with datetime suffix==> file.$(date "+%Y-%m-%d_%H%M%S").txt ==> file.YY-MM-DD_ssssss.txt
export CURL_CA_BUNDLE=/etc/ssl/cert.pem

# Git autocompletion & prompt
#source ~/.git-completion.bash
#source ~/.git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PATH="/usr/local/sbin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/maxod/miniconda3/bin:$PATH"

alias base64enc='openssl enc -base64 <<<'
alias base64dec='openssl enc -base64 -d <<<'
alias base64paste='pbpaste | base64 --decode'  ## Copy text to clipborard then run this (MacOS only)

encode() { echo "$1" | base64 ; echo; }
decode() { echo "$1" | base64 -D ; echo; }
decode2() { python -m base64 -d <<< $1; }  ##ARG1= some base64 text

