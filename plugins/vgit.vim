"vgit
lua << END
require('vgit').setup({
settings = {
    live_blame = {
      enabled = true
    }
  }
})

vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'
END
