# nvim-rooter.lua

A high performance plugin to change your working directory to the project root when you open a file.
Basically a minimal version of [vim-rooter](https://github.com/airblade/vim-rooter) written in lua.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jedi2610/nvim-rooter.lua'
```

Using [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'jedi2610/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
}
```

## Usage

One line setup. This will create an `autocmd` for `FileType *` to change to root directory everytime
you change a buffer.

```vim
lua require'nvim-rooter'.setup()
```

## Configuration

You can pass arguments to the `setup` function. The following snippet are the default options. Also
note that you can use globs.

```vim
lua require'nvim-rooter'.setup( { rooter_patterns = { '.git', '.hg', '.svn' } } )
```

Exclude a pattern with the prefix `!`

```vim
lua require'nvim-rooter'.setup( { rooter_patterns = { '!.git/worktrees', '!build/*' } } )
```


## ROADMAP

- [x] Change to project root directory using patterns
- [x] cmd to toggle - something like `:RooterToggle`
- [x] Support `nvim-tree`
- [x] Resolve symlinks
- [x] support exclude
- [x] cache results
- [x] use `setup()`
- [x] cleanup code
- [ ] Emit autocmd?
- [ ] Extended support for patterns like `vim-rooter`?
- [ ] Support which directories/files trigger `:Rooter`?

## References

- [How to write neovim plugins in Lua](https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua)
- [lua - learn X in Y minutes](https://learnxinyminutes.com/docs/lua/)
- [vim-rooter](https://github.com/airblade/vim-rooter)
- [rooter.nvim](https://github.com/ygm2/rooter.nvim)


## Inspired by

- [vim-rooter](https://github.com/airblade/vim-rooter)
- [rooter.nvim](https://github.com/ygm2/rooter.nvim)


This was originally meant to be a PR to [rooter.nvim](https://github.com/ygm2/rooter.nvim), but
then i ended up rewriting everything, cause I like the lua language and wanted to do something
with it.

This was done on [stream](https://youtu.be/9RKkTfv4bNI). I have previous experience with lua (except
for the nvim config), just skimmed through the first 2 references in 20 minutes and started writing
this plugin, and this is my first lua project or even my first vim plugin so please don't judge
what i was doing on stream.
