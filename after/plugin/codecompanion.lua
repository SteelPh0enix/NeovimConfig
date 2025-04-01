local cc = require("codecompanion")
cc.setup({
    strategies = {
        chat = {
            adapter = "ollama",
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
