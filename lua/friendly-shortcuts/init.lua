-- Set options and add mapping such that Vim behaves a lot like MS-Windows
local map = vim.keymap.set

-- BACKSPACE in VISUAL mode deletes selection
map('v', '<BS>', '"_d', { desc = 'Delete selection'})

-- Cut/Copy/Paste
if vim.fn.has('clipboard') == 1 then
  -- Cut | CTRL-X and SHIFT-Del
  map('v', '<C-X>', 'd', { desc = 'Cut selected content'})
  map('v', '<S-Del>', 'd', { desc = 'Cut selected content'})

  -- Copy | CTRL-C and CTRL-Insert
  map('v', '<C-C>', 'ygv', { desc = 'Copy selected content'})
  map('v', '<C-Insert>', 'ygv', { desc = 'Copy selected content'})

  -- Paste | CTRL-V and SHIFT-Insert
  map('n', '<C-V>', '"+gp', { desc = 'Paste clipboard content' })
  map('n', '<S-Insert>', '"+gp', { desc = 'Paste clipboard content' })
  -- Paste in COMMAND and INSERT mode
  map({ 'i', 'c' }, '<C-V>', '<C-R>+', { desc = 'Paste clipboard content'})
  map({ 'i', 'c' }, '<S-Insert>', '<C-R>+', { desc = 'Paste clipboard content'})
end

-- Use CTRL-Q to do what CTRL-V used to do
map('', '<C-Q>', '<C-V>')

-- Save | CTRL-S
map('n', '<C-S>', '<CMD>update<CR>', { desc = 'Save current file if modified'})
map('v', '<C-S>', '<C-C><CMD>update<CR>', { desc = 'Save current file if modified'})
map('i', '<C-S>', '<Esc><CMD>update<CR>gi', { desc = 'Save current file if modified'})

-- Undo | CTRL-Z (except in cmdline)
map('', '<C-Z>', 'u', { desc = 'Undo action'})
map('i', '<C-Z>', '<C-0>u', { desc = 'Undo action'})

-- Redo | CTRL-Y (except in cmdline, although not repeat)
map('', '<C-Y>', '<C-R>', { desc = 'Redo action'})
map('i', '<C-Y>', '<C-O><C-R>', { desc = 'Redo action'})

-- Select all | CTRL-A
map('', '<C-A>', 'gggH<C-O>G', { desc = 'Select all file content'})
map('i', '<C-A>', '<C-O>gg<C-O>gH<C-O>G', { desc = 'Select all file content'})
map('c', '<C-A>', '<C-C>gggH<C-O>G', { desc = 'Select all file content'})
map('o', '<C-A>', '<C-C>gggH<C-O>G', { desc = 'Select all file content'})
map('s', '<C-A>', '<C-C>gggH<C-O>G', { desc = 'Select all file content'})
map('x', '<C-A>', '<C-C>ggVG', { desc = 'Select all file content'})
