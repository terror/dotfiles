require("functions")

local home = vim.env.HOME
local config = home .. "/.config/nvim"

map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "<c-j>", "<esc>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")
map("i", "<up>", "<nop>")
map("i", "?", "?<c-g>u")
map("n", "0", "^")
map("n", ";;", "<esc>A;<esc>")
map("n", "<bs>", "<c-^>")
map("n", "<c-j>", ":bp<cr>")
map("n", "<c-k>", ":bn<cr>")
map("n", "<c-l>", ":noh<cr>", { silent = true })
map("n", "<down>", "<nop>")
map("n", "<leader>ad", ":ALEDetail<cr>")
map("n", "<leader>ea", ":split ~/.aliases<cr>")
map("n", "<leader>en", ":e notes.md<cr>")
map("n", "<leader>s", ":RustFmt<cr>")
map("n", "<leader>sa", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>ss", ":source %<cr>")
map("n", "<leader>sv", ":luafile " .. config .. "/init.lua<cr>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")
map("n", "<up>", "<nop>")
map("n", "N", "Nzzzv")
map("n", "Q", "<nop>")
map("n", "Y", "y$")
map("n", "Z", "<cmd>wq<cr>")
map("n", "^", "0")
map("n", "n", "nzzzv")
map("o", "b", "i[")
map("o", "p", "i(")
map("v", "<leader>a#", ":Tabularize /#<cr>")
map("v", "<leader>a:", ":Tabularize /:<cr>")
map("v", "<leader>a=", ":Tabularize /=<cr>")
map("v", "<leader>s", ":sort<cr>")
map("v", '<leader>a"', ':Tabularize /"<cr>')

-- Add custom find command to telescope: `find_files`
-- in order to find dotfiles + ignore git files
map(
  "n",
  "<c-s>",
  remove_newlines([[
<cmd>
lua require("telescope.builtin").find_files({
  find_command = {
    "rg",
    "--files",
    "--hidden",
    "-g",
    "!.git"
  }})
<cr>
]]),
  { noremap = true, silent = true }
)

-- Map `<c-p>` to file browser can create files with <c-e>
map(
  "n",
  "<c-p>",
  remove_newlines([[
<cmd>
lua require(
  "telescope.builtin"
).file_browser()
<cr>
]]),
  { noremap = true, silent = true }
)
