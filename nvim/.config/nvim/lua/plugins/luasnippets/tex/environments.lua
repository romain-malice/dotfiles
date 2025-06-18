---@diagnostic disable: undefined-global

local lineBegin = require("luasnip.extras.expand_conditions").line_begin

local isFirstLine = function()
    local lineNumber = vim.fn["line"](".")
    if lineNumber == 1 then -- If first line
        return true
    else
        return false
    end
end

local texZones = {}
texZones.inMathzone = function() -- math context detection
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
texZones.inText = function()
    return not texZones.in_mathzone()
end
texZones.inComment = function() -- comment detection
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end
texZones.inEnv = function(name) -- generic environment detection
    local is_inside = vim.fn["vimtex#env#is_inside"](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
texZones.inEquation = function() -- equation environment detection
    return texZones.in_env("equation")
end
texZones.inItemize = function() -- itemize environment detection
    return texZones.in_env("itemize")
end
texZones.inTikz = function() -- TikZ picture environment detection
    return texZones.in_env("tikzpicture")
end

return {
    s(
        { trig = "header" },
        fmta(
            [[
                \documentclass[a4paper, 12pt]{article}
                \input{../preamble.tex}

                \title{<>}

                \begin{document}

                \maketitle
                \tableofcontents

                <>

                \end{document}
            ]],
            {
                i(1),
                i(0),
            }
        ),
        { condition = isFirstLine }
    ),
    s({ trig = "-" }, { t("\\item ") }),
}, {
    s({ trig = "mk" }, fmta("\\(<>\\)", { i(1) })),
    s(
        { trig = "dm" },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
                <>
            ]],
            { i(1), i(0) }
        ),
        { condition = lineBegin }
    ),
    s(
        { trig = "all" },
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
                <>
            ]],
            { i(1), i(0) }
        ),
        { condition = lineBegin }
    ),
    s(
        { trig = "caa" },
        fmta(
            [[
                \begin{cases}
                    <>
                \end{cases}
            ]],
            { i(1) }
        ),
        { condition = lineBegin }
    ),
    s(
        { trig = "beg" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
                <>
            ]],
            {
                i(1),
                i(2),
                extras.rep(1),
                i(0),
            }
        ),
        { condition = lineBegin }
    ),
    s(
        { trig = "itt" },
        fmta(
            [[
                \begin{itemize}
                    <>
                \end{itemize}
                <>
            ]],
            {
                i(1),
                i(0),
            }
        ),
        { condition = lineBegin }
    ),
    s(
        { trig = "lii" },
        fmta(
            [[
                \begin{enumerate}
                    <>
                \end{enumerate}
                <>
            ]],
            {
                i(1),
                i(0),
            }
        ),
        { condition = lineBegin }
    ),
}
