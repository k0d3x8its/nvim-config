return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header

    dashboard.section.header.val = {
      "                                            ",
      " ██╗  ██╗ ██████╗ ██████╗ ██████╗ ██╗  ██╗  ",
      " ██║ ██╔╝██╔═████╗██╔══██╗╚════██╗╚██╗██╔╝  ",
      " █████╔╝ ██║██╔██║██║  ██║ █████╔╝ ╚███╔╝   ",
      " ██╔═██╗ ████╔╝██║██║  ██║ ╚═══██╗ ██╔██╗   ",
      " ██║  ██╗╚██████╔╝██████╔╝██████╔╝██╔╝ ██╗  ",
      " ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝  ",
      "                                            ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>lua require('utils.telescope_home').find_files()<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>lua require('utils.telescope_home').live_grep()<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("SPC cf", "  > NVIM Config",
        "<cmd>lua require('utils.config_tree_toggle').toggle_at_config()<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    local avalanche_logo = {
      "         ++         ",
      "        ++++        ",
      "       ++++  +      ",
      "      ++++  +++     ",
      "     ++++  +++++    ",
    }

    local buidl_txt = {
      " ██████╗ ██╗   ██╗██╗██████╗ ██╗          ██████╗ ███╗   ██╗    ",
      " ██╔══██╗██║   ██║██║██╔══██╗██║         ██╔═══██╗████╗  ██║    ",
      " ██████╔╝██║   ██║██║██║  ██║██║         ██║   ██║██╔██╗ ██║    ",
      " ██╔══██╗██║   ██║██║██║  ██║██║         ██║   ██║██║╚██╗██║    ",
      " ██████╔╝╚██████╔╝██║██████╔╝███████╗    ╚██████╔╝██║ ╚████║    ",
    }

    local footer = {}

    for i = 1, #buidl_txt do
      footer[i] = buidl_txt[i] .. "" .. avalanche_logo[i]
    end

    -- 6) Tell Alpha to use our footer (no global hl so inline works)
    dashboard.section.footer.val  = footer
    dashboard.section.footer.opts = {
      position = "center",
    }

    -- Send config to alpha
    alpha.setup(dashboard.config)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
