return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,

		event = {
			"BufReadPre /home/unkwn/Documents/Obsidian/Vault/**.md",
			"BufNewFile /home/unkwn/Documents/Obsidian/Vault/**.md",
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		keys = {
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Obsidian: New note" },
			{ "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Obsidian: Daily note" },
			{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Obsidian: Search in notes (Telescope)" },
			{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Obsidian: Show links" },
		},

		opts = {
			workspaces = {
				{
					name = "personal",
					path = "/home/unkwn/Documents/Obsidian/Vault",
				},
			},

			-- bullet = {
			-- 	icons = { "● ", "○ ", "◆ ", "◇ " },
			-- },

			preferred_link_style = "markdown",
			notes_subdir = "Inbox",

			new_notes_location = "notes_subdir",

			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			daily_notes = {
				folder = "Daily",
				date_format = "%d-%m-%Y",
			},

			completion = {
				min_chars = 0,
				nvim_cmp = true,
				match_case = true,
				create_new = true,
			},

			ui = {
				enable = true,
				checkboxes = {},
				bullets = {},
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "markdown_inline" },

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {

			heading = {
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				sign = false,
			},

			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},

			checkbox = {
				enabled = true,
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
				},
			},

			bullet = {
				icons = { "●", "○", "◆", "◇" },
			},
		},
	},
}
