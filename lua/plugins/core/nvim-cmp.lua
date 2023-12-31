return {
    'hrsh7th/nvim-cmp',
    dependencies = {'hrsh7th/cmp-nvim-lsp', 'lukas-reineke/cmp-under-comparator', 'onsails/lspkind.nvim'},
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
				-- TODO: Move those to 'which-key.lua'
                -- Toggle docs.
                ['<C-g>'] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end,
                -- Move 4 lines above in docs.
                ['<C-b>'] = function(fallback)
                    if cmp.visible_docs() then
                        cmp.scroll_docs(-4)
                    else
                        fallback()
                    end
                end,
                -- Move 4 lines bellow in docs.
                ['<C-n>'] = function(fallback)
                    if cmp.visible_docs() then
                        cmp.scroll_docs(4)
                    else
                        fallback()
                    end
                end,
                -- Move to next completion.
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                -- Move to previous completion.
                ['<S-Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
                -- Invoke completion.
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Accept currently selected item if explicitly selected.
                ['<CR>'] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true})
                    else
                        fallback()
                    end
                end,
            }),
            sources = cmp.config.sources({
                {name = 'nvim_lsp'},
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require('cmp-under-comparator').under,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.oder,
                }
            },
            formatting = {
                format = require('lspkind').cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    before = function(entry, vim_item)
                        return vim_item
                    end
                })
            }
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').pyright.setup({
            capabilities = capabilites
        })
    end,
}
