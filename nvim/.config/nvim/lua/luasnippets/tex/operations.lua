-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then include `condition = in_mathzone` to any snippet you want to
-- expand only in math contexts.

return {}, {
    -- Another take on the fraction snippet without using a regex trigger
    s({ trig = "ff", condition = in_mathzone },
        fmta(
            "\\frac{<>}{<>}",
            {
                i(1),
                i(2),
            }
        )
    ),
    s({ trig = "sr", condition = in_mathzone, wordTrig = false }, t("^{2}")),
    s({ trig = "cb", condition = in_mathzone, wordTrig = false }, t("^{3}")),
    s({ trig = "rd", condition = in_mathzone, wordTrig = false }, fmta("^{<>}", { i(1) })),
    s({ trig = "inv", condition = in_mathzone, wordTrig = false }, t("^{-1}")),
    s({ trig = "_", condition = in_mathzone, wordTrig = false }, fmta("_{<>}", { i(1) })),
}
