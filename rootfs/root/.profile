stty rows 30 cols 80
printf "\e[38;2;91;206;250m    ______     __       __     \e[0m\n\
\e[38;2;245;169;184m   / ____/____/ /____  / /___ _\e[0m\n\
\e[38;2;255;255;255m  / __/ / ___/ __/ _ \/ / __ \`/\e[0m\n\
\e[38;2;245;169;184m / /___(__  ) /_/  __/ / /_/ / \e[0m\n\
\e[38;2;91;206;250m/_____/____/\__/\___/_/\__,_/  \e[0m\n\n\
\e[95m┌──────────────────────────────────────────────────────────┐\e[0m\n\
\e[95m│\e[0m             To the gray that's become dull,              \e[95m│\e[0m\n\
\e[95m│\e[0m          Even this talent is something borrowed          \e[95m│\e[0m\n\
\e[95m│\e[0m        \"Your life isn't over, so don't give up!\"         \e[95m│\e[0m\n\
\e[95m│\e[0m                   Someone's voice rang                   \e[95m│\e[0m\n\
\e[95m└──────────────────────────────────────────────────────────┘\e[0m\n"
echo -e "meow\a ah! $USER :3"
echo "welcome to the inner world of estela (?)"
echo "please enjoy exploring"
echo "for noobs: try 'welp' command"
PS1="\[\e[42m\] \[\e[40;37m\] \w \[\e[0m\e[93m\]❯\[\e[37m\]❯\[\e[35m\]❯\[\e[30m\]❯\[\e[0m\] "
alias cat='printf "\a" >&2; cat' #now it's cat