local avante = require("avante")

avante.setup({
    provider = "ollama",
    -- auto_suggestions_provider = "ollama",
    -- memory_summary_provider = "ollama",

    vendors = {
        ollama = {
            endpoint = "http://127.0.0.1:11434",
            timeout = 30000, -- Timeout in milliseconds
            model = "DeepHermes:latest",
            options = {
                temperature = 0.3,
                num_ctx = 16000,
            },
        },
    },

    file_selector = {
        provider = "fzf",
    }


})
