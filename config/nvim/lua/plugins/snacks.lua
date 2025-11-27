return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			-- Show hidden and ignored files by default
			hidden = true, -- Show hidden files by default
			ignored = true, -- Show ignored files by default
		},
		picker = {
			sources = {
				explorer = {
					-- Show hidden and ignored files by default in the explorer picker
					hidden = true, -- Show hidden files
					ignored = true, -- Show git ignored files
				},
				files = {
					-- Wheter find-files will show hidden and ignored files or not.
					hidden = true, -- Search hidden files
					-- ignored = true, -- Search ignored files
				},
			},
		},
	},
}
