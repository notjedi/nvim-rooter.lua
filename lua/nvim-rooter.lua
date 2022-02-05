local _config = {
  patterns = {},
  exclude_filetypes = {
    [''] = true,
    ['help'] = true,
    ['nofile'] = true,
    ['NvimTree'] = true,
    ['dashboard'] = true,
    ['TelescopePrompt'] = true,
  },
}

local function parent_dir(dir)
  return vim.fn.fnamemodify(dir, ':h')
end

local function change_dir(dir)
  dir = vim.fn.fnameescape(dir)
  vim.api.nvim_set_current_dir(dir)
  local result, module = pcall(require, 'nvim-tree.lib')
  if result then
    module.change_dir(dir)
  end
end

local function get_root()
  -- don't need to resove sybolic links explicitly, because
  -- `nvim_buf_get_name` returns the resolved path.
  local current = vim.api.nvim_buf_get_name(0)
  local parent = parent_dir(current)

  while 1 do
    for _, pattern in ipairs(_config.patterns) do
      if vim.fn.glob(parent .. '/' .. pattern) ~= '' then
        parent = vim.startswith(pattern, '!') and nil or parent
        return parent
      end
    end

    current, parent = parent, parent_dir(parent)
    if parent == current then
      break
    end
  end
  return nil
end

local function rooter()
  if _config.exclude_filetypes[vim.bo.filetype] ~= nil then
    return nil
  end

  local root = vim.fn.exists('b:root_dir') and vim.api.nvim_buf_get_var(0, 'root_dir') or nil
  if root == nil then
    root = get_root()
    vim.api.nvim_buf_set_var(0, 'root_dir', root)
  end

  if root ~= nil then
    change_dir(root)
  end
end

local function rooter_toggle()
  local parent = parent_dir(vim.api.nvim_buf_get_name(0))
  if vim.fn.getcwd() ~= parent then
    change_dir(parent)
  else
    rooter()
  end
end

local function setup(rooter_patterns)
  _config.patterns = rooter_patterns == nil and { '.git', '.hg', '.svn' } or rooter_patterns
end

return {
  setup = setup,
  rooter = rooter,
  rooter_toggle = rooter_toggle,
}
