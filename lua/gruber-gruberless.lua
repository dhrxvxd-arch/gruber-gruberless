local config = require("gruber-gruberless.config")

local M = {}

function M.on_colorscheme()
	vim.cmd([[autocmd! GruberDarker]])
	vim.cmd([[augroup! GruberDarker]])
end

local function create_autocmds()
	local gruber_darker_group = vim.api.nvim_create_augroup("GruberGruberless", { clear = true })
	vim.api.nvim_create_autocmd("ColorSchemePre", {
		group = gruber_darker_group,
		pattern = "*",
		callback = function()
			require("gruber-gruberless").on_colorscheme()
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = gruber_darker_group,
		pattern = "qf,help",
		callback = function()
			vim.cmd.setlocal("winhighlight=Normal:NormalSB,SignColumn:SignColumnSB")
		end,
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = gruber_darker_group,
		pattern = "*",
		callback = function()
			-- Hide all semantic highlights
			for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
				vim.api.nvim_set_hl(0, group, {})
			end
		end,
	})
end

function M.load()
	local highlights = require("gruber-gruberless.highlights")

	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = "gruber-gruberless"

	highlights.setup()

	create_autocmds()
end

function M.colorscheme() end

function M.setup(opts)
	config.setup(opts)
end

return M
