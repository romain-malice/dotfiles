-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then include `condition = in_mathzone` to any snippet you want to
-- expand only in math contexts.
--
return {},
    {
        s({ trig = "sms", condition = in_mathzone }, fmta([[\sum_{<>=<>}^{<>}]], { i(1, "i"), i(2, "0"), i(3, "n") })),
    }
