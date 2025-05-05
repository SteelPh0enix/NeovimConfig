local cc = require("codecompanion")
cc.setup({
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        default = "Qwen3-14B:latest",
                    },
                    num_ctx = {
                        default = 20480,
                    },
                },
            })
        end,
    },
    strategies = {
        chat = {
            adapter = "ollama",
            slash_commands = {
                ["buffer"] = {
                    opts = {
                        provider = "fzf_lua"
                    }
                },
                ["file"] = {
                    opts = {
                        provider = "fzf_lua"
                    }
                },
                ["help"] = {
                    opts = {
                        provider = "fzf_lua"
                    }
                },
                ["symbols"] = {
                    opts = {
                        provider = "fzf_lua"
                    }
                }
            },
            keymaps = {
                completion = {
                    modes = {
                        i = "<C-Space>"
                    }
                }
            }
        },
        inline = {
            adapter = "ollama",
            keymaps = {
                accept_change = { modes = { n = "<Leader>ca" }, description = "Accept suggested change", },
                reject_change = { modes = { n = "<Leader>cr" }, description = "Reject suggested change", },
            }
        },
        cmd = { adapter = "ollama" }
    },
    display = {
        show_settings = true
    }
})

vim.cmd([[cab cc CodeCompanion]])
