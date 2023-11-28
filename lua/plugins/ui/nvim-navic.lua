return {
    'SmiteshP/nvim-navic',
    config = function()
        local navic = require('nvim-navic')
        navic.setup({
            icons = {
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = ' ',
                Interface = ' ',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = ' ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = ' ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' '
            },
            highlight = true,
            depth_limit = 5,
            safe_output = true,
            lsp = {
                auto_attach = true,
                preference = {
                    'pyright',
                }
            },
        })

        require('lspconfig').pyright.setup({
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        })
    end,
}
