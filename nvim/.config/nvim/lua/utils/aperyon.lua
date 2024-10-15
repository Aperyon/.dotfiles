local function toggle_background()
	local current_background = vim.o.background
	local new_background = current_background == "dark" and "light" or "dark"
	vim.o.background = new_background
end

return {
	toggle_background = toggle_background,
}

