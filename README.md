## About
My current .bashrc and .bash_profile as an example/template.
This was made for Slackware 15 but should work on most if not all GNU/Linux systems.

Color scheme is for xfce-terminal or xterm with a black background, and may not be suitable on other terminal emulators. See section 3 (Config) under "Usage" of this README for instructions on changing the colors.

![image](https://github.com/user-attachments/assets/f10cab28-82b5-450e-911d-cf2887f5d869)



### Usage
1. Backup your current .bashrc and .bash_profile
```
mkdir ~/backup
mv ~/.bashrc ~/backup/.bashrc_old
mv ~/.bash_profile ~/backup/.bash_profile_old
```

2. Copy the files to your home directory
```
cp Download_Directory/.bashrc ~/.bashrc
cp Download_Directory/.bash_profile ~/.bash_profile
```

3. Config

Edit the `.bashrc` file with whatever text editor you prefer.

This is set up by default to run fastfetch when the shell is opened. Neofetch is no longer maintained, and should be replaced with another system information tool. If you still want to use neofetch, comment out `fastfetch` on line 20, and uncomment `neofetch`, or add whatever system information tool you use.


Lines 97 through 109 set the colors of the bash prompt. Change any color enclosed in `${}` to whatever you prefer. The list of colors starts at line 30. `${NC}` resets the text to the default color and font weight.

The defaults are:
- time = bright black (a dark grey)
- username:
  - remote shell = bright green
  - normal user = bright red 
  - root user = bright blue
- working directory = bright black


Lines 112 through 116 display a message when connected via SSH, and a warning when connected through other applications such as telnet. Comment them out if you don't want this.

Line 199 is the bash prompt. Edit the escape sequences to change the prompt.
```
\A prints the current time in 24 hour format HH:MM
\u prints the current username
\h prints the hostname
\w prints the full path of the current working directory
```
Some other escape sequences that can be added to the prompt:
```
\d prints the date in the format "weekday month date"
\H prints the hostname and the domain name
\T prints the current time in 12 hour format HH:MM:SS 
\t prints the current time in 24 hour format HH:MM:SS 
\W prints the current working directory (not the full path)
```
