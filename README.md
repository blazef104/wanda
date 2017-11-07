###Slightly modified fishbone theme

## Installation

```omf
clone the repository and put in ~/.local/share/omf/themes/wanda
then omf theme wanda
```
## Features

* Only displays an abbreviatted path on left side;
* On git repositories shows its current branch and modifications on right side;
* For Python users, if there is an active virtualenv, it will be displayed at right between brackets;
* At start up, shows user name, date, uptime, informations about OS, CPU, memory and network;

## Project structure
The theme files are separated as follows:

* fish_prompt.fish: Has the function to print the prompt line;
* fish_right_prompt.fish: Prints the right side of the shell prompt;
* fish_greeting.fish: Prints the welcome message at shell session start up;

# License

Original theme from [pantuza][original]

[original]: https://github.com/pantuza

[MIT][mit] © [blazef104][author]


[mit]: https://opensource.org/licenses/MIT
[author]: https://github.com/blazef104
