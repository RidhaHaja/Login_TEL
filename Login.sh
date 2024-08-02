#!/usr/bin/env bash
# dibuat oleh Ryda® - AmaN

. ~/.tel/scripts/readconfigs.sh #read user settings

# Place file in internal storage, then open tel and type: - " cp /sdcard/Login.sh ~ && chmod +x ~/Login.sh  "

# Open tel_profile  ( ~/.tel/.tel_profile ) then Add this " ~/Login.sh "

# Open userprefs.sh  ( ~/.tel/configs/userprefs.sh )
# Add this command line :
#     export NAME='username' # main/home window name 
#     export PSWRD='password' # your password
#     export LOCK='true' # true / false

# Kode warna
# Define some color code----
blk='\e[0;30m' # Black - Regular
red='\e[0;31m' # Red
grn='\e[0;32m' # Green
ylw='\e[0;33m' # Yellow
blu='\e[0;34m' # Blue
pur='\e[0;35m' # Purple
cyn='\e[0;36m' # Cyan
wht='\e[0;37m' # White
hj='\e[1;38;2;0;230;118m' # Green
rst='\e[0m'    # Text Reset

# Informasi Hardware
# Hardware info
ANDROID_VERSION=`getprop ro.build.version.release`
BUILDID=`getprop ro.build.id`
DEVICE=`getprop persist.sys.devicename`
HARDWARE=`getprop ro.hardware`
KERNEL_V=`uname`
MANUFACTURER=`getprop ro.product.manufacturer`
TYPE=`getprop ro.fota.type`
VERSION=`getprop ro.fota.version`
CPU_ABI=`getprop ro.product.cpu.abi`

# Icon
i_Phone=$(echo $'\uf42c')
i_OS=$(echo $'\uE70e')
i_user=$(echo $'\uf2bd')
i_CPU=$(echo $'\uF986')
i_Kernel=$(echo $'')
i_term=$(echo $'\uf68c')

# Nama Pengguna dan Password
# username and password you used are here
  username=$NAME # main/home window name
  password=$PSWRD # your password
    status=$LOCK # true / false
    
    trp() 
    {  
    # Mengabaikan sinyal SIGINT (Ctrl+C) dan SIGTSTP (Ctrl+Z)
    # 2) SIGINT	 3) SIGQUIT 4) SIGILL  5) SIGTRAP  6) SIGABRT	 9) SIGKILL 15) SIGTERM 19) SIGSTOP	20) SIGTSTP
    trap "" INT 2 3 4 5 6 9 15 19 20 
    # -echo	     Does not echo characters
    # -flusho     discard output
    # -icanon     desable special characters: erase, kill, werase, rprnt
    stty -echo -flusho
    } 
      
    ClearStdin ()
    {
      while read -e -t 0.1; do : ; done
    }

# Animasi pembuka
# Simple bash loading animation
function loading_icon() 
    {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    #local loading_animation=( '▰▱▱▱▱▱▱▱▱▱' '▰▰▱▱▱▱▱▱▱▱' '▰▰▰▱▱▱▱▱▱▱' '▱▰▰▰▱▱▱▱▱▱' '▱▱▰▰▰▱▱▱▱▱' '▱▱▱▰▰▰▱▱▱▱' '▱▱▱▱▰▰▰▱▱▱' '▱▱▱▱▱▰▰▰▱▱' '▱▱▱▱▱▱▰▰▰▱' '▱▱▱▱▱▱▱▰▰▰' '▱▱▱▱▱▱▱▱▰▰' '▱▱▱▱▱▱▱▱▱▰' '▱▱▱▱▱▱▱▱▱▱' '▱▱▱▱▱▱▱▱▱▱' )
    local loading_animation=( '█■■■■■■■■■' '██■■■■■■■■' '███■■■■■■■' '■███■■■■■■' '■■███■■■■■' '■■■███■■■■' '■■■■███■■■' '■■■■■███■■' '■■■■■■███■' '■■■■■■■███' '■■■■■■■■██' '■■■■■■■■■█' '■■■■■■■■■■' '■■■■■■■■■■' )
      
    echo -n "${loading_message} "
    
    # This part is to make the cursor not blink
    # on top of the animation while it lasts
    tput civis
    trap "tput cnorm" EXIT
  
    while [ "${load_interval}" -ne "${elapsed}" ]; do
        for frame in "${loading_animation[@]}" ; do
          printf "%s\b\b\b\b\b\b\b\b\b\b" "${frame}"
          sleep 0.25
        done
        elapsed=$(( elapsed + 1 ))
    done
    }
      
 trp   
clear # Membersihkan layar terminal
# Menyimpan teks pesan selamat datang
teks=" [TEL]: Welcome to Termux Expert Launcher ..."

# Waktu jeda antara pengetikan setiap karakter (dalam detik)
jeda=0.10

# Loop untuk efek animasi mengetik pada teks " [TEL]: Welcome to Termux Expert Launcher ..."
for ((i=0; i<${#teks}; i++)); do
    # Mencetak satu karakter dari teks
    echo -n "${teks:$i:1}"
    # Jeda waktu antara pengetikan karakter
    sleep $jeda           
done
  
echo -e "$grn

    


 

                   ┬  ┌─┐┌─┐┌┬┐┬┌┐┌┌─┐
                  $red │  │ │├─┤ │││││││ ┬ $grn
                   ┴─┘└─┘┴ ┴─┴┘┴┘└┘└─┘ $rst" 

loading_icon 3 "                      "
  clear
  # Menu Login
  LogiN()
  {
    clear
echo -e " $grn
  
                       ╦  ┌─┐┌─┐┬╔╗╔
                      $red ║  │ ││ ┬│║║║ $grn
                       ╩═╝└─┘└─┘┴╝╚╝
  $ylw ──────────────────────────────────────────────────────
          $VERSION
  $red  Warning:$wht Don't Forget Your$pur Username$wht and$pur Password
  $ylw ────────────────────────────────────────────────────── $rst

     $cyn ANDROID      $grn : $rst $i_OS  $ANDROID_VERSION ($BUILDID)
     $cyn TYPE         $grn : $rst $i_Phone  $TYPE
     $cyn HARDWARE     $grn : $rst $i_CPU $HARDWARE
     $cyn ARCHITECT    $grn : $rst $i_term  $CPU_ABI
     $cyn MANUFACTURER $grn : $rst $i_user  $MANUFACTURER
     $cyn KERNEL       $grn : $rst $i_Kernel  $KERNEL_V
     $cyn LOCATION     $grn : $rst $LOCATION
     $cyn TOOL's NAME  $grn : $rst TEL-Customizer

  $ylw ──────────────────────────────────────────────────────$rst
    
                  ──▄▀▀▀▄──\e[1;32mPlease Login$rst─
                  ──█───█───To Continue─
                  ─███████─────────▄▀▀▄─
                  ░██─▀─██░░█▀█▀▀▀▀█░░█░
                  ░███▄███░░▀░▀░░░░░▀▀░░
"
    
ClearStdin
stty echo
read -r -p $'       \e[33m\033[1m\033[33m[\033[31m+\033[33m] \033[37mInput \033[33mUsername for Login:\033[32m ' user
read -r -s -p $'       \e[32m\033[1m\033[33m[\033[31m+\033[33m] \033[37mInput \033[33mPassword for Login:\033[33m ' pass                                                
  # kode periksa user dan password
  # check User Code and Password  
if [[ $pass == $password && $user == $username ]]; then
  # jika user dan password benar
  # if true
     sleep 1
     clear
     ls
  # Menampilkan AsciiArt
  # Your asciiart is displayed here
  # I use tui_flower_2 from the tuie theme
     #bash /storage/emulated/0/t-ui/AddOn/ascii/ASCIIart -b
     #sleep 3
  else
  # jika user / password salah
  # if the user / password is incorrect
     clear
     trp
     echo -e "$red
     You Entered wrong Details! $rst"
     sleep 2
    ClearStdin
  # Animasi kereta api - (pkg install sl)
     #sl   # show “sl” (Steam Locomotive) train Animation  - (pkg install sl)
    LogiN
fi
  }
  
  if [[ $status == true ]]; then
  LogiN
    else
  
echo -e " 
__ __| ____| |
   |   __|   |
   |   |     |
  _|  _____|_____|
    \nis in low power mode...
	"
	#use a tmux wait / set-hook onresize here
	tput cup $(tput lines) 0
	read -n 1 -s -r -p " [ Swipe up or Press any key to exit ]"
  ClearStdin
  clear
  fi