---@diagnostic disable: undefined-global
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
return {}, {
    -- Symbols
    s({ trig = "ooo", wordTrig = false }, { t("\\infty") }, { condition = in_mathzone }),
    s(
        { trig = "prr", wordTrig = false },
        fmta("\\prod_{<>=<>}^{<>}", {
            i(1, "i"),
            i(2, "1"),
            i(3, "n"),
        }
        ),
        { condition = in_mathzone }
    ),
    s(
        { trig = "sum", wordTrig = false },
        fmta("\\sum_{<>=<>}^{<>}", {
            i(1, "i"),
            i(2, "1"),
            i(3, "n"),
        }
        ),
        { condition = in_mathzone }
    ),
    s(
        { trig = "lim", wordTrig = false },
        fmta("\\lim_{<>\\to <>}", {
            i(1, "x"),
            i(2, "\\infty"),
        }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "prod", wordTrig = false }, { t("\\prod") }, { condition = in_mathzone }),
    s({ trig = "+-", wordTrig = false }, { t("\\pm") }, { condition = in_mathzone }),
    s({ trig = "-+", wordTrig = false }, { t("\\mp") }, { condition = in_mathzone }),
    s({ trig = "...", wordTrig = false }, { t("\\dots") }, { condition = in_mathzone }),
    s({ trig = "nabl", wordTrig = false }, { t("\\nabla") }, { condition = in_mathzone }),
    s({ trig = "del", wordTrig = false }, { t("\\nabla") }, { condition = in_mathzone }),
    s({ trig = "**"}, { t("\\times") }, { condition = in_mathzone }),
    s({ trig = "c.", wordTrig = false }, { t("\\cdot") }, { condition = in_mathzone }),
    s({ trig = "//", wordTrig = false }, { t("\\parallel") }, { condition = in_mathzone }),
    s({ trig = "ssi", wordTrig = false }, { t("\\iff") }, { condition = in_mathzone }),
    s({ trig = "prp", wordTrig = false }, { t("\\bot") }, { condition = in_mathzone }),

    -- Equivalences
    s({ trig = "===", wordTrig = false }, { t("\\equiv") }, { condition = in_mathzone }),
    s({ trig = "!=", wordTrig = false }, { t("\\neq") }, { condition = in_mathzone }),
    s({ trig = ">=", wordTrig = false }, { t("\\geq") }, { condition = in_mathzone }),
    s({ trig = "<=", wordTrig = false }, { t("\\leq") }, { condition = in_mathzone }),
    s({ trig = ">>", wordTrig = false }, { t("\\gg") }, { condition = in_mathzone }),
    s({ trig = "<<", wordTrig = false }, { t("\\ll") }, { condition = in_mathzone }),
    s({ trig = "simm", wordTrig = false }, { t("\\sim") }, { condition = in_mathzone }),
    s({ trig = "sim=", wordTrig = false }, { t("\\simeq") }, { condition = in_mathzone }),
    s({ trig = "~=", wordTrig = false }, { t("\\approx") }, { condition = in_mathzone }),
    s({ trig = "prop", wordTrig = false }, { t("\\propto") }, { condition = in_mathzone }),

    -- Logic
    s({ trig = "<->", wordTrig = false }, { t("\\leftrightarrow ") }, { condition = in_mathzone }),
    s({ trig = "->", wordTrig = false }, { t("\\to") }, { condition = in_mathzone }),
    s({ trig = "!>", wordTrig = false }, { t("\\mapsto") }, { condition = in_mathzone }),
    s({ trig = "=>", wordTrig = false }, { t("\\implies") }, { condition = in_mathzone }),
    s({ trig = "=<", wordTrig = false }, { t("\\impliedby") }, { condition = in_mathzone }),
    s({ trig = "and", wordTrig = false }, { t("\\cap") }, { condition = in_mathzone }),
    s({ trig = "orr", wordTrig = false }, { t("\\cup") }, { condition = in_mathzone }),
    s({ trig = "exists", wordTrig = false }, { t("\\exists") }, { condition = in_mathzone }),

    -- Sets
    s({ trig = "inn", wordTrig = false }, { t("\\in") }, { condition = in_mathzone }),
    s({ trig = "notin", wordTrig = false }, { t("\\not\\in") }, { condition = in_mathzone }),
    s({ trig = "\\\\\\", wordTrig = false }, { t("\\setminus") }, { condition = in_mathzone }),
    s({ trig = "sub=", wordTrig = false }, { t("\\subseteq") }, { condition = in_mathzone }),
    s({ trig = "sup=", wordTrig = false }, { t("\\supseteq") }, { condition = in_mathzone }),
    s({ trig = "eset", wordTrig = false }, { t("\\emptyset") }, { condition = in_mathzone }),
    s({ trig = "LL", wordTrig = false }, { t("\\mathcal{L}") }, { condition = in_mathzone }),
    s({ trig = "HH", wordTrig = false }, { t("\\mathcal{H}") }, { condition = in_mathzone }),
    s({ trig = "CC", wordTrig = false }, { t("\\mathbb{C}") }, { condition = in_mathzone }),
    s({ trig = "RR", wordTrig = false }, { t("\\mathbb{R}") }, { condition = in_mathzone }),
    s({ trig = "ZZ", wordTrig = false }, { t("\\mathbb{Z}") }, { condition = in_mathzone }),
    s({ trig = "NN", wordTrig = false }, { t("\\mathbb{N}") }, { condition = in_mathzone }),
}
