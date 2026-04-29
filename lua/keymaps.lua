local wk = require("which-key")

local function command(cmd)
  return ("<Cmd>%s<CR>"):format(cmd)
end

local function toggle_autopairs()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if ok then
    autopairs.toggle()
  end
end

wk.add({
  { "<leader>?", command("WhichKey"), desc = "show keymaps" },

  { "<leader>p", group = "plugins" },
  { "<leader>pl", command("Lazy"), desc = "lazy plugin manager" },
  { "<leader>pm", command("Mason"), desc = "mason tool manager" },
  { "<leader>ph", command("checkhealth"), desc = "check health" },
  { "<leader>ps", command("LuaSnipListAvailable"), desc = "list snippets" },
  { "<leader>pS", command("LuaSnipUnlinkCurrent"), desc = "unlink snippet" },
  { "<leader>pt", command("TSInstallInfo"), desc = "treesitter parsers" },
  { "<leader>pT", command("TSBufToggle highlight"), desc = "toggle treesitter highlight" },
  { "<leader>pu", command("TSUpdate"), desc = "update treesitter parsers" },

  { "<leader>a", group = "autopairs" },
  { "<leader>at", toggle_autopairs, desc = "toggle autopairs" },

  { "<leader>m", group = "markdown" },
  { "<leader>mp", command("Glow"), desc = "preview markdown" },
  { "<leader>mc", command("Glow!"), desc = "close markdown preview" },

  { "<leader>o", group = "org" },
  { "<leader>oa", command("Org agenda"), desc = "agenda menu" },
  { "<leader>oc", command("Org capture"), desc = "capture" },
  { "<leader>oh", command("Org help"), desc = "org help" },
  { "<leader>oi", command("Org indent_mode"), desc = "toggle virtual indent" },
  { "<leader>ol", command("Org store_link"), desc = "store link" },
  { "<leader>ot", command("Org agenda t"), desc = "todo agenda" },

  { "<leader>x", group = "latex" },
  { "<leader>xc", command("VimtexCompile"), desc = "compile" },
  { "<leader>xC", command("VimtexClean"), desc = "clean aux files" },
  { "<leader>xe", command("VimtexErrors"), desc = "errors" },
  { "<leader>xi", command("VimtexInfo"), desc = "info" },
  { "<leader>xk", command("VimtexStop"), desc = "stop compiler" },
  { "<leader>xl", command("VimtexLog"), desc = "compiler log" },
  { "<leader>xr", command("VimtexReload"), desc = "reload vimtex" },
  { "<leader>xs", command("VimtexStatus"), desc = "status" },
  { "<leader>xt", command("VimtexTocToggle"), desc = "toggle toc" },
  { "<leader>xv", command("VimtexView"), desc = "view pdf" },
})
