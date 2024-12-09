return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
            automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"omnisharp",
				"tailwindcss",
				"lua_ls",
				"docker_compose_language_service",
				"dockerls",
				"astro",
				"gopls",
				"pyright",
				-- "ruff",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"black", -- python formatter
				"flake8", -- python linter
				{'eslint_d', version = '13.1.2'}, -- js linter
				"golangci-lint",
				"gofumpt",
			},
		})
	end,
}
