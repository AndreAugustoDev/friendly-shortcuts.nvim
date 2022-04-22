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
  map('v', '<C-C>', 'ygv')
  map('v', '<C-Insert>', 'ygv')

  -- Paste | CTRL-V and SHIFT-Insert
  map('n', '<C-V>', '"+gp')
  map('n', '<S-Insert>', '"+gp')
  -- Paste in COMMAND and INSERT mode
  map({ 'i', 'c' }, '<C-V>', '<C-R>+')
  map({ 'i', 'c' }, '<S-Insert>', '<C-R>+')
end

-- Use CTRL-Q to do what CTRL-V used to do
map('', '<C-Q>', '<C-V>')

-- Save | CTRL-S
map('n', '<C-S>', '<CMD>update<CR>')
map('v', '<C-S>', '<C-C><CMD>update<CR>')
map('i', '<C-S>', '<Esc><CMD>update<CR>gi')

-- Undo | CTRL-Z (except in cmdline)
map('', '<C-Z>', 'u')
map('i', '<C-Z>', '<C-0>u')

-- Redo | CTRL-Y (except in cmdline, although not repeat)
map('', '<C-Y>', '<C-R>')
map('i', '<C-Y>', '<C-O><C-R>')

-- Select all | CTRL-A
map('', '<C-A>', 'gggH<C-O>G')
map('i', '<C-A>', '<C-O>gg<C-O>gH<C-O>G')
map('c', '<C-A>', '<C-C>gggH<C-O>G')
map('o', '<C-A>', '<C-C>gggH<C-O>G')
map('s', '<C-A>', '<C-C>gggH<C-O>G')
map('x', '<C-A>', '<C-C>ggVG')
