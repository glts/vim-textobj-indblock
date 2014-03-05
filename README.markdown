textobj-indblock
================

This Vim plugin provides text objects to act on a block of indentation
whitespace based on the indentation of the current line.

This plugin supplements and closely follows the example of the
[textobj-indent][1] plugin.

In general, that plugin is more useful but on some occasions it can be
preferable to act on indentation whitespace directly.

[1]: https://github.com/kana/vim-textobj-indent

Usage
-----

As usual, on-line documentation is available at `:h textobj-indblock`.

But as they say, a picture is worth a thousand words. Have a GIF:

![demo](https://raw.github.com/glts/vim-textobj-indblock/gh-pages/images/demo.gif)

The GIF shows the effects of the two text objects 'inner/a block of
indentation whitespace' in Visual mode, `vio` and `vao` by default. ('o'
is right next to 'i' for 'indent'.)

Requirements
------------

*   Vim 7.3 or later
*   [textobj-user][2] Vim plugin

[2]: https://github.com/kana/vim-textobj-user

Installation
------------

Move the files into their respective directories inside your `~/.vim`
directory (or your `$HOME\vimfiles` directory if you're on Windows).

This plugin plays well with plugin managers. For example, with
[pathogen.vim][3] the installation is as simple as this:

    git clone git://github.com/glts/vim-textobj-indblock.git ~/.vim/bundle/textobj-indblock

Don't forget to install textobj-user, too, if you haven't already.

[3]: http://www.vim.org/scripts/script.php?script_id=2332
