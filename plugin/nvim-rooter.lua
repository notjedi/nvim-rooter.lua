if vim.fn.exists('g:loaded_nvim_rooter') == 1 or not vim.fn.has('nvim-0.7') then
  return
end
vim.g.loaded_nvim_rooter = 1

local cmd = vim.api.nvim_create_user_command

cmd('Rooter', function()
  require('nvim-rooter').rooter()
end, {})
cmd('GetRootDir', function()
  require('nvim-rooter').get_root()
end, {})
cmd('RooterToggle', function()
  require('nvim-rooter').rooter_toggle()
end, {})
