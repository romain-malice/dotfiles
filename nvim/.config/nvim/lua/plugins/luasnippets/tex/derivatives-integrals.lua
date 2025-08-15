---@diagnostic disable: undefined-global
local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
return {
	s(
		{ trig = "par", wordTrig = false },
		fmta("\\frac{\\partial <> }{\\partial <> }", {
			i(1, "u"),
			i(2, "x"),
		}),
		{ condition = in_mathzone }
	),
}, {
	-- Derivatives
	s(
		{ trig = "([^%a])dd(%a|(\\tau))", regTrig = true, wordTrig = false },
		fmta("<>\\frac{\\mathrm{d}}{\\mathrm{d}<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "pa(%a)(%a)", regTrig = true },
		fmta("\\frac{ \\partial <> }{ \\partial <> }", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "\\frac{ \\partial (%a) }{ \\partial (%a) }(%a)", regTrig = true },
		fmta("\\frac{ \\partial^{2}} <> }{ \\partial <> \\partial <> }", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
			f(function(_, snip)
				return snip.captures[3]
			end),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "\\frac{ \\partial (%a) }{ \\partial (%a) }(%d)", regTrig = true },
		fmta("\\frac{ \\partial^{2}} <> }{ \\partial <>^{<>} }", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
			f(function(_, snip)
				return snip.captures[3]
			end),
		}),
		{ condition = in_mathzone }
	),

	-- Integrals
	s(
		{ trig = "([^(iodsvl)])int", wordTrig = false, regTrig = true },
		fmta("<>\\int <> d<>", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			c(2, {
				i(2, "x"),
				t("\\mathbf{l}"),
				t("\\mathbf{S}"),
				t("V"),
			}),
		}),
		{ condition = in_mathzone }
	),
	s({ trig = "sint", wordTrig = false }, fmta("\\iint_{S} <> \\mathrm{d}\\bm{S}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "lint", wordTrig = false }, fmta("\\int_{L} <> \\mathrm{d}\\bm{l}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "vint", wordTrig = false }, fmta("\\iiint_{V} <> \\mathrm{d}V", { i(1) }), { condition = in_mathzone }),
	s(
		{ trig = "oinf", wordTrig = false },
		fmta("\\int_{0}^{\\infty} <> \\mathrm{d}<>", {
			i(1),
			c(2, {
				i(2, "t"),
				t("x"),
				t("y"),
				t("z"),
			}),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "infi", wordTrig = false },
		fmta("\\int_{-\\infty}^{\\infty} <> \\mathrm{d}<>", {
			i(1),
			c(2, {
				i(2, "t"),
				t("x"),
				t("y"),
				t("z"),
			}),
		}),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "dint", wordTrig = false },
		fmta("\\int_{<>}^{<>} <> \\mathrm{d}<>", {
			i(1),
			i(2),
			i(3),
			c(4, {
				i(2, "t"),
				t("x"),
				t("y"),
				t("z"),
			}),
		}),
		{ condition = in_mathzone }
	),
	s({ trig = "oint", wordTrig = false }, { t("\\oint") }, { condition = in_mathzone }),
	s({ trig = "iint", wordTrig = false }, { t("\\iint") }, { condition = in_mathzone }),
	s({ trig = "iiint", wordTrig = false }, { t("\\iiint") }, { condition = in_mathzone }),
}
