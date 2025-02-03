local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

local signs = {
    Error = "E",
    Warn = "W",
    Hint = "H",
    Info = "I"
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities
    })
end

local ensure_installed = {
    "lua_ls",
    "vtsls",
    "gopls",
    "tailwindcss",
    "clangd",
    "rust_analyzer",
    "jsonls",
    "jdtls",
    "buf_ls",
}

mason_lspconfig.setup({
    ensure_installed = ensure_installed,
    handlers = {
        default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_continuous_assign_statement = false,
                                align_continuous_rect_table_field = false,
                                align_array_table = false,
                            },
                        },
                    },
                },
            })
        end,
        vtsls = function()
            lspconfig.vtsls.setup({
                capabilities = lsp_capabilities,
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                },
                settings = {
                    typescript = {
                        updateImportsOnFileMove = { enabled = 'always' },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        inlayHints = {
                            enumMemberValues = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            parameterNames = { enabled = 'literals' },
                            parameterTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            variableTypes = { enabled = false },
                        },
                    },
                    javascript = {
                        updateImportsOnFileMove = { enabled = 'always' },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        inlayHints = {
                            enumMemberValues = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            parameterNames = { enabled = 'literals' },
                            parameterTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            variableTypes = { enabled = false },
                        },
                    },
                },
            })
        end,

        gopls = function()
            lspconfig.gopls.setup({
                capabilities = lsp_capabilities,
                filetypes = { "go", "gomod" },
            })
        end,
    },
})
