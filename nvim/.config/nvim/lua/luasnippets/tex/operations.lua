-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then include `condition = in_mathzone` to any snippet you want to
-- expand only in math contexts.

return {
    s({ trig = "sum", condition = in_mathzone }, fmta([[\sum_{<>=<>}^{<>}]], { i(1, "i"), i(2, "0"), i(3, "n") })),
}, {
    -- Simple operations
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
    s({ trig = "conj", condition = in_mathzone, wordTrig = false }, t("^{*}")),
    s({ trig = "_", condition = in_mathzone, wordTrig = false }, fmta("_{<>}", { i(1) })),
    s({ trig = "sq", condition = in_mathzone, wordTrig = false }, fmta("\\sqrt{<>}", { i(1) })),


    -- Integrals
    s({ trig = "dint", condition = in_mathzone }, fmta("\\int_{<>}^{<>} <> \\diff <>", { i(1), i(2), i(3), i(4, "x") })),
    s({ trig = "oinf", condition = in_mathzone },
        fmta("\\int_{0}^{\\infty} <> \\diff <>", { i(1), i(2, "x") })),
    s({ trig = "infi", condition = in_mathzone },
        fmta("\\int_{-\\infty}^{\\infty} <> \\diff <>", { i(1), i(2, "x") })),
    s({ trig = "sms", condition = in_mathzone }, fmta([[\sum_{<>}]], { i(1, "i") })),

    -- Derivatives
    s({ trig = "dd([%a%s])([%a])", regTrig = true, condition = in_mathzone },
        fmta(
            "\\frac{\\diff <>}{\\diff <>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                f(function(_, snip) return snip.captures[2] end),
            }
        )
    ),
    s({ trig = "dff", regTrig = true },
        fmta(
            "\\frac{\\diff <>}{\\diff <>}",
            {
                i(1),
                i(2)
            }
        )
    ),

}
