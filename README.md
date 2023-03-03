# nvim-rooter.lua

A high performance plugin to change your working directory to the project root when you open a file.
Basically a minimal version of [vim-rooter](https://github.com/airblade/vim-rooter) written in lua.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'notjedi/nvim-rooter.lua'
```

Using [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'notjedi/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
}
```

## Usage

One line setup. This will create an `autocmd` for `FileType *` to change to root directory everytime
you switch buffers.

```vim
lua require'nvim-rooter'.setup()
```

* For nvim-tree support/integration, add the following to you nvim-tree config:

```lua
require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})
```

## Configuration

The following snippet is the default configuration. Also note that you can use globs.

```lua
require('nvim-rooter').setup {
  rooter_patterns = { '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = false,
}
```

Specify the root is a certain directory, prefix it with `=`

```vim
lua require('nvim-rooter').setup { rooter_patterns = { '=src' } }
```

To invoke `:Rooter` manually and not have it run everytime you switch/open buffers, you can pass the
following argument while setting up nvim-rooter.

```vim
lua  require('nvim-rooter').setup { manual = true }
```

By default all files trigger `:Rooter` but you can configure this by passing the `trigger_patterns`
argument while you call `setup()`

```vim
lua require('nvim-rooter').setup { trigger_patterns = { '*.py', '*.lua' } }
```

Exclude certain filetypes using the config below. Note that filetypes is must be passed as arguments
and not file extensions. For example: `python` instead of `py`. Use `vim.bo.filetype` to get the
filetype of the current buffer.

```vim
lua require('nvim-rooter').setup { exclude_filetypes = { 'python', 'lua' } }
```

## Comparison

|                                     |      vim-rooter     |    nvim-rooter.lua  |      rooter.nvim |
| ----------------------------------- | ------------------- | ------------------- | ---------------- |
| loading time                        |       0.185 ms      |       0.083 ms      |       3.206 ms   |
| `:RooterToggle`                     |         :x:         |  :heavy_check_mark: |         :x:      |
| trigger `:Rooter` on filename match |  :heavy_check_mark: |  :heavy_check_mark: |         :x:      |
| exclude filetypes                   |  :heavy_check_mark: |  :heavy_check_mark: |         :x:      |
| resolve symlinks                    |  :heavy_check_mark: |  :heavy_check_mark: |         :x:      |
| emit `autocmd`                      |  :heavy_check_mark: |         :x:         |         :x:      |
| `=` prefix                          |  :heavy_check_mark: |  :heavy_check_mark: |         :x:      |
| other prefixes                      |  :heavy_check_mark: |         :x:         |         :x:      |
| support files in HDD                |  :heavy_check_mark: |  :heavy_check_mark: |         :x:      |

*Note*: what `:RooterToggle` does is, it switches between root and current directory. whereas in
`vim-rooter`, it toggles between automatic and manual mode.

*Note*: the loading time was profiled using the `--startuptime` option.

## Roadmap

- [x] Change to project root directory using patterns
- [x] cmd to toggle - something like `:RooterToggle` (not the same as vim-rooter)
- [x] Support `nvim-tree`
- [x] Resolve symlinks
- [x] support something like `=src`
- [x] cache results
- [x] use `setup()`
- [x] cleanup code
- [x] manual trigger
- [ ] when rootless
- [x] cleanup code
- [ ] Emit autocmd?
- [ ] write tests
- [ ] Extended support for patterns like `vim-rooter`?
- [x] Support which directories/files trigger `:Rooter`?

## References

- [How to write neovim plugins in Lua](https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua)
- [lua - learn X in Y minutes](https://learnxinyminutes.com/docs/lua/)
- [vim-rooter](https://github.com/airblade/vim-rooter)
- [rooter.nvim](https://github.com/ygm2/rooter.nvim)


## Inspired by

- [vim-rooter](https://github.com/airblade/vim-rooter)

<br>

This was originally meant to be a PR to [rooter.nvim](https://github.com/ygm2/rooter.nvim), but
then i ended up rewriting everything, cause I like the lua language and wanted to do something
with it. Also there was way too many different and unrelated changes to PR, so I ended up forking
it.

This plugin was written on [stream](https://youtu.be/9RKkTfv4bNI). I don't have previous experience
with lua (except for the nvim config), just skimmed through the first 2 references in 20 minutes and
started writing this plugin, and this is my first lua project or even my first vim plugin so please
don't judge what i was doing on stream.
