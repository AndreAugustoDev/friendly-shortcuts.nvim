-- Set options and add mapping such that Vim behaves a lot like MS-Windows
local map = vim.keymap.set

-- BACKSPACE in VISUAL mode deletes selection
map('v', '<BS>', 'd')

