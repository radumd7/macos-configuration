return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				vtsls = {
					settings = {
						typescript = {
							preferences = {
								-- Prefer non-relative imports
								importModuleSpecifier = "non-relative",
								includePackageJsonAutoImports = "off",
							},
							-- Inlay hints
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = false },
							},
						},
						javascript = {
							preferences = {
								-- Prefer non-relative imports
								importModuleSpecifier = "non-relative",
								includePackageJsonAutoImports = "off",
							},
						},
						vtsls = {
							experimental = {
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
					},
				},
			},
		},
	},
}
