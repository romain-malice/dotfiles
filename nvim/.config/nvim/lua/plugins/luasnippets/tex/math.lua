---@diagnostic disable: undefined-global

local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {}, {
	-- Exponents
	s({ trig = "sr", wordTrig = false }, { t("^{2}") }, { condition = in_mathzone }),
	s({ trig = "cb", wordTrig = false }, { t("^{3}") }, { condition = in_mathzone }),
	s({ trig = "inv", wordTrig = false }, { t("^{-1}") }, { condition = in_mathzone }),
	s({ trig = "sqq", wordTrig = false }, { t("\\sqrt{"), i(1), t("}") }, { condition = in_mathzone }),

	-- Super/Sub-scripts
	s({ trig = "rd", wordTrig = false }, { t("^{"), i(1), t("}") }, { condition = in_mathzone }),
	s({ trig = "_", wordTrig = false }, { t("_{"), i(1), t("}") }, { condition = in_mathzone }),
	s({ trig = "sx", wordTrig = false }, { t("_{\\text{"), i(1), t("}}") }, { condition = in_mathzone }),
    s({ trig = "tx" }, fmta("\\text{<>}", { i(1) }, { condition = in_mathzone })),
	s(
		{ trig = "([%a])([%d])", regTrig = true },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = in_mathzone }
	),
	s({ trig = "xnn", wordTrig = false }, { t("x_{n}") }, { condition = in_mathzone }),
	s({ trig = "xii", wordTrig = false }, { t("x_{i}") }, { condition = in_mathzone }),
	s({ trig = "xjj", wordTrig = false }, { t("x_{j}") }, { condition = in_mathzone }),
	s({ trig = "xij", wordTrig = false }, { t("x_{ij}") }, { condition = in_mathzone }),
	s({ trig = "xp1", wordTrig = false }, { t("x_{n+1}") }, { condition = in_mathzone }),
	s({ trig = "ynn", wordTrig = false }, { t("y_{n}") }, { condition = in_mathzone }),
	s({ trig = "yii", wordTrig = false }, { t("y_{i}") }, { condition = in_mathzone }),
	s({ trig = "yjj", wordTrig = false }, { t("y_{j}") }, { condition = in_mathzone }),
	s({ trig = "uxx" }, { t("u_{x}") }, { condition = in_mathzone }),
	s({ trig = "uyy" }, { t("u_{y}") }, { condition = in_mathzone }),
	s({ trig = "uzz" }, { t("u_{z}") }, { condition = in_mathzone }),
	s({ trig = "utt" }, { t("u_{t}") }, { condition = in_mathzone }),
	s(
		{ trig = "u_{([xyzt])}([xyzt])", regTrig = true },
		fmta("u_{<><>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		})
	),

	-- Complex numbers
	s({ trig = "conj", wordTrig = false }, { t("^{*}") }, { condition = in_mathzone }),
	s({ trig = "Re", wordTrig = false }, { t("\\mathrm{Re}") }, { condition = in_mathzone }),
	s({ trig = "Im", wordTrig = false }, { t("\\mathrm{Im}") }, { condition = in_mathzone }),

	s(
		{ trig = "([^%a])ff", regTrig = true, wordTrig = false },
		fmta([[<>\frac{<>}{<>}]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		})
	),

	-- Brackets
	s(
		{ trig = "lr(", wordTrig = false },
		fmta("\\left( <> \\right)", {
			i(1),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr{", wordTrig = false },
		fmta("\\left\\{ <> \\right\\}", {
			i(1),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr[", wordTrig = false },
		fmta("\\left[ <> \\right]", {
			i(1),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lr|", wordTrig = false },
		fmta("\\left| <> \\right|", {
			i(1),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lra", wordTrig = false },
		fmta("\\langle <> \\rangle",{
			i(1),
		}),
		{ condition = in_mathzone }
	),

	s({ trig = "rm" }, fmta("\\mathrm{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "clc" }, fmta("\\mathcal{<>}", { i(1) }), { condition = in_mathzone }),
}
