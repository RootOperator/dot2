return {
    'Robitx/gp.nvim',
    config = function ()
        require("gp").setup({
            default_command_agent = "CodeGemini",
            default_chat_agent = "ChatGemini",
            providers = {
                googleai = {
                    endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
                    secret = { "cat", "/home/rootoperator/.gemini_key" }
                }
            },
            agents = {
                {
                    provider = "googleai",
                    name = "CodeGemini",
                    chat = false,
                    command = true,
                    -- string with model name or table with model name and parameters
                    model = { model = "gemini-2.0-flash-exp", temperature = 1.1, top_p = 1 },
                    -- system prompt (use this to specify the persona/role of the AI)
                    system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n"
                },
                {
                    provider = "googleai",
                    name = "ChatGemini",
                    chat = true,
                    command = false,
                    -- string with model name or table with model name and parameters
                    model = { model = "gemini-2.0-flash-exp", temperature = 1.1, top_p = 1 },
                    -- system prompt (use this to specify the persona/role of the AI)
                    system_prompt = require("gp.defaults").chat_system_prompt
                }

            }

        })
    end
}
