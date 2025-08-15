---@diagnostic disable: undefined-global
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
return {}, {
    s(
        { trig = "([%a])bfb", regTrig = true, wordTrig = false },
        fmta("\\mathbf{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "bfb", wordTrig = false },
        fmta("\\mathbf{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "bsb", wordTrig = false },
        fmta("\\boldsymbol{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])vec", regTrig = true, wordTrig = false },
        fmta("\\vec{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "vec", wordTrig = false },
        fmta("\\vec{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])hat", regTrig = true, wordTrig = false },
        fmta("\\hat{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "hat", wordTrig = false },
        fmta("\\hat{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])bar", regTrig = true, wordTrig = false },
        fmta("\\bar{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "bar", wordTrig = false },
        fmta("\\bar{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])dot", regTrig = true, wordTrig = false },
        fmta("\\dot{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "dot", wordTrig = false },
        fmta("\\dot{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])ddot", regTrig = true, wordTrig = false },
        fmta("\\ddot{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "ddot", wordTrig = false },
        fmta("\\ddot{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])tilde", regTrig = true, wordTrig = false },
        fmta("\\tilde{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "tilde", wordTrig = false },
        fmta("\\tilde{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "([%a])und", regTrig = true, wordTrig = false },
        fmta("\\und{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_mathzone }
    ),
    s(
        { trig = "und", wordTrig = false },
        fmta("\\und{<>}", {
            i(1),
        }),
        { condition = in_mathzone }
    ),
}
