# nvim-rooter.lua

## Usage

Install with [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jedi2610/nvim-rooter.lua'
```

Install with [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'jedi2610/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
}
```

## ROADMAP

- [x] Change to project root directory using patterns
- [x] cmd to toggle - something like `:RooterToggle`
- [x] Support `nvim-tree`
- [x] Resolve symlinks
- [ ] support exclude
- [x] cache results
- [x] use `setup()`
- [x] cleanup code
- [ ] should i remove `BufPostWrite`?
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
for the nvim config), just skimmed through [How to write neovim plugins in
Lua](https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua) in 20 minutes and started
writing this plugin, and this is my first lua project or even my first vim plugin so please
don't judge what i was doing on stream.
