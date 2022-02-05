# nvim-rooter.lua

This was originally meant to be a PR for [rooter.nvim](https://github.com/ygm2/rooter.nvim), but
then i ended up rewriting everything, cause I like the lua language and wanted to do something
with it.

This was done on [stream](https://youtu.be/9RKkTfv4bNI). I have previous experience with lua (except
for the nvim config) and this is my first lua project so please don't judge what i was doing on
stream.

## ROADMAP

- [x] Change to project root directory using patterns
- [ ] cmd to toggle - something like `:RooterToggle`
- [x] Resolve symlinks
- [ ] Support `nvim-tree`
- [x] use `setup()`
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
