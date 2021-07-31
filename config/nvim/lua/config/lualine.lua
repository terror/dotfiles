require('lualine').setup {
  options = { lower = true, theme = 'dracula' },
  section = { lualine_a = {{ 'mode', lower = false }}, lualine_b = { 'branch' }}
}
