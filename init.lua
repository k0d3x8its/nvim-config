-- 1️⃣ Bootstrap lazy.nvim
local fn = vim.fn
local lazypath = fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2️⃣ Python provider
vim.g.python3_host_prog = '/home/broke/.config/nvim/venv/bin/python'

-- 3️⃣ Hand off to unit.lua
require("unit")

