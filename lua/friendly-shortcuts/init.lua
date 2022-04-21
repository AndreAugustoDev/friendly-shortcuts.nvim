-- Set options and add mapping such that Vim behaves a lot like MS-Windows
local map = vim.keymap.set

-- BACKSPACE in VISUAL mode deletes selection
map('v', '<BS>', 'd')

-- Cut/Copy/Paste
if vim.fn.has('clipboard') == 1 then
    -- Cut | CTRL-X and SHIFT-Del
    map('v', '<C-X>', '+x')
    map('v', '<S-Del>', '+x')

    -- Copy | CTRL-C and CTRL-Insert
    map('v', '<C-C>', '+y')
    map('v', '<C-Insert>', '+y')

    -- Paste | CTRL-V and SHIFT-Insert
    map('n', 'C-V', 'gP')
    map('n', 'S-Insert', 'gP')
    -- Paste in COMMAND mode
    map('c', 'C-V', '<C-R>+')
    map('c', 'S-Insert', '<C-R>+')
end

-- Use CTRL-Q to do what CTRL-V used to do
map('', '<C-Q>', '<C-V>')

-- Save | CTRL-S
map('n', '<C-S>', '<CMD>update<CR>')
map('v', '<C-S>', '<C-C><CMD>update<CR>')
map('i', '<C-S>', '<Esc><CMD>update<CR>gi')

-- Undo | CTRL-Z (not in cmdline though)
map('', '<C-Z>', 'u')
map('i', '<C-Z>', '<C-0>u')
