## dotfiles
> Just a mere backup of my aliases

### Preview
![Alt text](https://raw.github.com/platipo/dotfiles/master/Screenshot.png "screen")

### Installation
Why install them and mess your things up when you can link them? `Magic.sh` will link all files for you

```bash
git clone https://github.com/platipo/dotfiles ~/dots && cd ~/dots && ./Magic.sh
```
Also it will install minimal vim plugins in `~/.vim/bundle` like
- [pathogen](https://github.com/tpope/vim-pathogen/)
- [indentline](https://github.com/Yggdroot/indentLine)
- [contrastneed-theme](https://github.com/albertocg/contrastneed-theme)

If you like to add some padding around the terminal edges (like in the screenshot), just add 
```css
VteTerminal, vte-terminal {
    padding: 33px;
}
```
in `$XDG_CONFIG_HOME/gtk-3.0/gtk.css` ([source](https://github.com/thestinger/termite/#padding))


### Things you should install
| Application | Description |
|-------------|-------------|
| [bspwm](https://github.com/baskerville/bspwm) | WM |
| [sxhkd](https://github.com/baskerville/sxhkd) | WM hotkey daemon |
| [vim](https://github.com/vim/vim) | editor |
| [redshift](https://github.com/jonls/redshift) | screen color temperature regulator  |
| [rofi](https://github.com/DaveDavenport/rofi) | window switcher and application launcher |
| [zathura](https://github.com/pwmt/zathura) | PDF viewer |
| [compton](https://github.com/chjj/compton) | compositor |
| [polybar](https://github.com/jaagr/polybar) | status bar |
| [ranger](https://github.com/ranger/ranger) | console filemanager |
| [termite](https://github.com/thestinger/termite) | terminal |
| [i3block](https://github.com/karulont/i3lock-blur/) | simple screen locker |
| [feh](https://github.com/derf/feh) | image viewer |
| [arc-theme](https://github.com/horst3180/Arc-theme) | GTK theme |

### TODO
- [x] decent polybar (credits to [jaagr](https://github.com/jaagr/dots/tree/master/.local/etc/themer/themes/dracula))
- [x] vim & vimrc (sort of)
- [x] implement sxhkdrc
- [ ] ranger
- [ ] decent README

### Inspirations
[noctuid's dotfiles](https://github.com/noctuid/dotfiles) (mouseless workflow)

[stow master's dotfiles](https://github.com/xero/dotfiles)

[tudurom's dotfiles](https://github.com/tudurom/dotfiles)

[amix's vimrc](https://github.com/amix/vimrc)

[jaagr theme](https://github.com/jaagr/dots/tree/master/.local/etc/themer/themes/dracula)
