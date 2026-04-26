local M = {}

M.setup = function ()
	--- nothing
end

---@class present.Slides
---@fields slides string[]: The slides of the file


--- Takes some lines and parses them
---@param lines string[]: The lines in the buffer
---@return present.Slides
local parse_slides = function (lines)
	local slides = { slides = {} }
	local current_slide = {}

	local seperator = "^#"
	for _, line in ipairs(lines) do
		print(line, "find:", line:find(seperator), "|")
		if line:find(seperator) then
			if #current_slide > 0 then
			table.insert(slides.slides, current_slide)
			end

			current_slide = {}
		end
	table.insert(current_slide, line)
	end
	table.insert(slides.slides, current_slide)

	return slides
end

vim.print(parse_slides {
	"# Hello",
	"this is something else",
	"# World",
	"this is another thing",
})

return M
