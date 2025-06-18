---@diagnostic disable: undefined-global

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

return {
	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "U", wordTrig = false },
		fmta("\\underbrace{<>}_{<>}", {
			d(1, get_visual),
			i(2),
		})
	),
    s(
		{ trig = "O", wordTrig = false },
		fmta("\\overbrace{<>}_{<>}", {
			d(1, get_visual),
			i(2),
		})
	),
    s(
		{ trig = "S", wordTrig = false },
		fmta("\\underset{<>}_{<>}", {
			d(1, get_visual),
			i(2),
		})
	),
	s(
		{ trig = "C", wordTrig = false },
		fmta("\\cancel{<>}_{<>}", {
			i(2),
			d(1, get_visual),
		})
	),
	s(
		{ trig = "T", wordTrig = false },
		fmta("\\cancelto{<>}{<>}", {
			i(2),
			d(1, get_visual),
		})
	),
}
