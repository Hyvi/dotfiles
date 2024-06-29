local copilot_chat = require("CopilotChat")
local actions = require('CopilotChat.actions')
local integration = require('CopilotChat.integrations.fzflua')

local function pick(pick_actions)
    return function()
        integration.pick(pick_actions(), {
            fzf_tmux_opts = {
                ['-d'] = '45%',
            },
        })
    end
end

copilot_chat.setup({
  debug = true,
  show_help = "yes",
  prompts = {
    Explain = "Explain how it works by English language.",
    Review = "Review the following code and provide concise suggestions.",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  event = "VeryLazy",
})

vim.keymap.set({ 'n', 'v' }, '<leader>ah', pick(actions.help_actions), { desc = 'AI Help Actions' })
vim.keymap.set({ 'n', 'v' }, '<leader>ap', pick(actions.prompt_actions), { desc = 'AI Prompt Actions' })
