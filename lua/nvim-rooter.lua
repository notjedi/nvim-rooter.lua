local _config = {
    exclude = {},
    patterns = {},
}

local function parent_dir(dir)
    return vim.fn.fnamemodify(dir, ':h')
end

local function change_dir(dir)
    vim.loop.chdir(dir)
    result, module = pcall(require, 'nvim-tree.lib')
    if result then
        module.change_dir(dir)
    end
end

local function rooter()
    -- don't need to resove sybolic links explicitly, because
    -- `nvim_buf_get_name` returns the resolved path.
    local current, parent = vim.api.nvim_buf_get_name(0)
    local parent = parent_dir(current)

    while 1 do
        for _, pattern in ipairs(_config.patterns) do
            if vim.fn.glob(parent .. '/' .. pattern) ~= '' then
                change_dir(parent)
                return
            end
        end

        current, parent = parent, parent_dir(parent)
        if parent == current then
            break
        end
    end
end

local function rooter_toggle() end

local function setup(rooter_patterns)
    if rooter_patterns == nil then
        _config.patterns = {
            '.git',
            '.hg',
            '.svn',
        }
    else
        for _, key in ipairs(rooter_patterns) do
            if vim.startswith(key, '!') then
                table.insert(_config.exclude, key:sub(2, #key))
            else
                table.insert(_config.pattersn, key)
            end
        end
    end
end

return {
    setup = setup,
    rooter = rooter,
    rooter_toggle = rooter_toggle,
}
