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

return {},
    {
        -- Delimiters
        s({ trig = "lr(", condition = in_mathzone, wordTrig = false }, fmta("\\left( <> \\right)", { i(1) })),
        s({ trig = "lr[", condition = in_mathzone, wordTrig = false }, fmta("\\left[ <> \\right]", { i(1) })),
        s({ trig = "lr|", condition = in_mathzone, wordTrig = false }, fmta("\\left| <> \\right|", { i(1) })),
        s({ trig = "lr{", condition = in_mathzone, wordTrig = false }, fmta("\\left\\{ <> \\right\\}", { i(1) })),

        -- Sub and super scripts
        s({ trig = "sx", wordTrig = false }, fmta("_\\text{<>}", { i(1) })),

        s({ trig = '([%a%)%]%}])([%d])', regTrig = true, wordTrig = false },
            fmta(
                "<>_{<>}",
                {
                    f(function(_, snip) return snip.captures[1] end),
                    f(function(_, snip) return snip.captures[2] end),
                }
            )
        ),
        s({ trig = '([%a%)%]%}])(ii|jj|nn|kk|ll)', regTrig = true, wordTrig = false, condition = in_mathzone },
            fmta(
                "<>_{<>}",
                {
                    f(function(_, snip) return snip.captures[1] end),
                    f(function(_, snip) return snip.captures[2] end),
                }
            )
        ),

        -- Usual sets
        s({ trig = "RR", condition = in_mathzone }, t("\\mathbb{R}")),
        s({ trig = "NN", condition = in_mathzone }, t("\\mathbb{N}")),

        -- Matrices
        s({ trig = "trr" }, t("^\\top")),

        -- Usual functions
        s({ trig = '([^%a])ee', regTrig = true, wordTrig = false },
            fmta(
                "<>e^{<>}",
                {
                    f(function(_, snip) return snip.captures[1] end),
                    d(1, get_visual)
                }
            )
        ),

    }
