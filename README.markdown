# xkb-layout.vim

xkb-layout.vim is for handier editing of xkb-layouts: useful mappings and
kind of "interface" to edit layouts in a user-friendly way.

Every time vim writes a file with .layout extension, it's creates
a corresponded file in the standart directory for xkb-layouts (/usr/share/X11/xkb/symbols/)
in xkb-layout format from the template that you can edit yourself.

Edit or create a whole new template in the $XDG_CONFIG_HOME/templates directory
with the fields you will change later like [  ].

Mappings:

<leader>uni Changes all the unicode codes (U####) to their symbols.
<leader>guni Does the opposite.

## Installation

Install using your favorite package manager, or use Vim's built-in package
support:

    mkdir -p ~/.vim/pack/ungnis/start
    cd ~/.vim/pack/ungnis/start
    git clone <github_link>
    vim -u NONE -c "helptags surround/doc" -c q
