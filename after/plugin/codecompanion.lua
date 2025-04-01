local cc = require("codecompanion")
cc.setup({
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
        inline = { adapter = "ollama" },
        cmd = { adapter = "ollama" }
    },
    display = {
        show_settings = true
    }
})
