return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          cmd = { "/usr/bin/qmlls6" },
          on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
          end,
        },
        gopls = {
          settings = {
            gopls = {
              semanticTokens = true,
            },
          },
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = false,
                tokenModifiers = {},
                tokenTypes = {},
              },
            },
          },
        },
      },
    },
  },
}
