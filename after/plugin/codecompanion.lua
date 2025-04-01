local cc = require("codecompanion")
cc.setup({
    strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        cmd = { adapter = "ollama" }
    },
    adapters = {
        opts = {
            show_defaults = false,
        }
    }
})
