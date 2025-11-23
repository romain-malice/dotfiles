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
        -- Delimiters
        s({ trig = "lr(", condition = in_mathzone, wordTrig = false }, fmta("\\left( <> \\right)", { i(1) })),
        s({ trig = "lr[", condition = in_mathzone, wordTrig = false }, fmta("\\left[ <> \\right]", { i(1) })),
        s({ trig = "lr|", condition = in_mathzone, wordTrig = false }, fmta("\\left| <> \\right|", { i(1) })),
        s({ trig = "lr{", condition = in_mathzone, wordTrig = false }, fmta("\\left\\{ <> \\right\\}", { i(1) })),

        -- Sub and super scripts
        s({ trig = "sx", wordTrig = false }, fmta("_\\text{<>}", { i(1) })),
        s({ trig = "RR" }, t("\\mathbb{R}")),
        s({ trig = "NN" }, t("\\mathbb{N}")),

        -- Matrices
        s({ trig = "trr" }, t("^\\top")),
    }
