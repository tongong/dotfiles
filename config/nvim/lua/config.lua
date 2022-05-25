require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    -- treesitter indentation is broken
    indent = {
        enable = false
    };
    highlight = {
        enable = true,
        -- needed to fix indentation...
        additional_vim_regex_highlighting = true,
    },
}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-j>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-k>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')["ccls"].setup {
    capabilities = capabilities;
    init_options = {
        cache = {
            directory = "/tmp/ccls-cache";
        };
        clang = {
            extraArgs = {"--gcc-toolchain=/usr"};
        };
    };
}
require('lspconfig')["texlab"].setup { capabilities = capabilities }
require('lspconfig')["tsserver"].setup { capabilities = capabilities }
