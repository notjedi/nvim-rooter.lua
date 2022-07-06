if vim.fn.exists('g:loaded_nvim_rooter') == 1 or vim.fn.has('nvim-0.5') == 0 then
  return
end
vim.g.loaded_nvim_rooter = 1

vim.cmd([[
  command! Rooter lua require 'nvim-rooter'.rooter()
  command! RooterToggle lua require 'nvim-rooter'.rooter_toggle()
  command! GetRootDir lua require 'nvim-rooter'.get_root()
  augroup nvim_rooter
    autocmd!
    autocmd BufRead * lua vim.api.nvim_buf_set_var(0, 'root_dir', nil)
    autocmd BufEnter * nested lua require'nvim-rooter'.rooter()
  augroup END
]])
