-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then include `condition = in_mathzone` to any snippet you want to
-- expand only in math contexts.

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end


return {}, {
    -- Modificators
    s({ trig = "bf", condition = in_mathzone },
        fmta("\\mathbf{<>}", { i(1), })
    ),
    s({ trig = "hat", condition = in_mathzone },
        fmta("\\hat{<>}", { i(1), })
    ),
    s({ trig = "rm", condition = in_mathzone },
        fmta("\\mathrm{<>}", { i(1), })
    ),

    -- Visual selection
    s({ trig = "U" }, fmta("\\underbrace{<>}_{<>}", { d(1, get_visual), i(2) }))
}
