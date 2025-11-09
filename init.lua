-- ===============================
-- Bootstrap Lazy.nvim
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing Lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ===============================
-- Load Lazy and your plugins
-- ===============================
local lazy = require("lazy")

lazy.setup("config.lazy", {
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- ensures exact plugin versions
})

-- ===============================
-- Auto-sync plugins on first run
-- ===============================
if not vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/lazy.nvim") then
  vim.cmd("Lazy sync")
end
