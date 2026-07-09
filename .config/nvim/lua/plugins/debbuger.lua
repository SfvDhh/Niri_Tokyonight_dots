return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",

		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- For auto install LSPs and DAPs
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb", "bash", "debugpy" },
			automatic_installation = true,

			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		dapui.setup({
			controls = {
				enabled = false,
			},

			layouts = {
				{
					elements = {
						-- { id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 50,
					position = "right",
				},
			},
		})

		-- Rules for auto open dap-ui
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
			vim.defer_fn(function()
				vim.cmd("wincmd l")
			end, 50)
		end

		-- Idk what is this
		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "CursorLine", numhl = "" })

		-- Bindings

		-- For dap
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Start/Continue" })
		vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "DAP: Step over" })
		vim.keymap.set("n", "<leader>dsq", dap.step_out, { desc = "DAP: Step out" })
		vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "DAP: Step into" })
	end,
}
