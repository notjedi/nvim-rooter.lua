if vim.fn.exists('g:loaded_nvim_rooter') == 1 or not vim.fn.has('nvim-0.7') then
  return
end
vim.g.loaded_nvim_rooter = 1

local cmd = vim.api.nvim_create_user_command

cmd('Rooter', function()
  require('nvim-rooter').rooter_default()
end, {})
cmd('RooterTo', function(opts)
  require('nvim-rooter').rooter_custom({opts.fargs[1]})
end, {nargs = 1})
cmd('GetRootDir', function()
  require('nvim-rooter').get_root()
end, {})
cmd('RooterToggle', function()
  require('nvim-rooter').rooter_toggle()
end, {})
