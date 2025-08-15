---@diagnostic disable: undefined-global

local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local GREEK =
	"(alpha|beta|gamma|delta|epsilon|zeta|eta|theta|iota|kappa|lambda|mu|nu|xi|pi|pi|rho|sigma|tau|upsilon|phi|chi|psi|omega|Gamma|Delta|Theta|Lambda|Xi|Pi|Sigma|Upsilon|Phi|Psi|Omega|varepsilon|vartheta|varpi|varrho|varsigma|varphi)"

return {}, {
	s({trig = ";a", wordTrig = false}, { t("\\alpha") }, {condition = in_mathzone}),
	s({trig = ";b", wordTrig = false}, { t("\\beta") }, {condition = in_mathzone}),
	s({trig = ";g", wordTrig = false}, { t("\\gamma") }, {condition = in_mathzone}),
	s({trig = ";d", wordTrig = false}, { t("\\delta") }, {condition = in_mathzone}),
	s({trig = ";e", wordTrig = false}, { t("\\varepsilon") }, {condition = in_mathzone}),
	s({trig = ";z", wordTrig = false}, { t("\\zeta") }, {condition = in_mathzone}),
	s({trig = ";h", wordTrig = false}, { t("\\eta") }, {condition = in_mathzone}),
	s({trig = "\\tauh", wordTrig = false}, { t("\\theta") }, {condition = in_mathzone}),
	s({trig = ";i", wordTrig = false}, { t("\\iota") }, {condition = in_mathzone}),
	s({trig = ";k", wordTrig = false}, { t("\\kappa") }, {condition = in_mathzone}),
	s({trig = ";l", wordTrig = false}, { t("\\lambda") }, {condition = in_mathzone}),
	s({trig = ";m", wordTrig = false}, { t("\\mu") }, {condition = in_mathzone}),
	s({trig = ";n", wordTrig = false}, { t("\\nu") }, {condition = in_mathzone}),
	s({trig = ";x", wordTrig = false}, { t("\\xi") }, {condition = in_mathzone}),
	s({trig = ";p", wordTrig = false}, { t("\\pi") }, {condition = in_mathzone}),
	s({trig = "pi", wordTrig = false}, { t("\\pi") }, {condition = in_mathzone}),
	s({trig = ";r", wordTrig = false}, { t("\\rho") }, {condition = in_mathzone}),
	s({trig = ";s", wordTrig = false}, { t("\\sigma") }, {condition = in_mathzone}),
	s({trig = ";t", wordTrig = false}, { t("\\tau") }, {condition = in_mathzone}),
	s({trig = ";u", wordTrig = false}, { t("\\upsilon") }, {condition = in_mathzone}),
	s({trig = "\\pih", wordTrig = false}, { t("\\phi") }, {condition = in_mathzone}),
	s({trig = ";ch", wordTrig = false}, { t("\\chi") }, {condition = in_mathzone}),
	s({trig = "\\pis", wordTrig = false}, { t("\\psi") }, {condition = in_mathzone}),
	s({trig = ";w", wordTrig = false}, { t("\\omega") }, {condition = in_mathzone}),
	s({trig = ";G", wordTrig = false}, { t("\\Gamma") }, {condition = in_mathzone}),
	s({trig = ";D", wordTrig = false}, { t("\\Delta") }, {condition = in_mathzone}),
	s({trig = ";Th", wordTrig = false}, { t("\\Theta") }, {condition = in_mathzone}),
	s({trig = ";L", wordTrig = false}, { t("\\Lambda") }, {condition = in_mathzone}),
	s({trig = ";X", wordTrig = false}, { t("\\Xi") }, {condition = in_mathzone}),
	s({trig = ";P", wordTrig = false}, { t("\\Pi") }, {condition = in_mathzone}),
	s({trig = ";S", wordTrig = false}, { t("\\Sigma") }, {condition = in_mathzone}),
	s({trig = ";U", wordTrig = false}, { t("\\Upsilon") }, {condition = in_mathzone}),
	s({trig = "\\Pih", wordTrig = false}, { t("\\Phi") }, {condition = in_mathzone}),
	s({trig = "\\Pis", wordTrig = false}, { t("\\Psi") }, {condition = in_mathzone}),
	s({trig = ";W", wordTrig = false}, { t("\\Omega") }, {condition = in_mathzone}),
	s({trig = ";ve", wordTrig = false}, { t("\\epsilon") }, {condition = in_mathzone}),
	s({trig = ";vth", wordTrig = false}, { t("\\vartheta") }, {condition = in_mathzone}),
	s({trig = ";vp", wordTrig = false}, { t("\\varpi") }, {condition = in_mathzone}),
	s({trig = ";vr", wordTrig = false}, { t("\\varrho") }, {condition = in_mathzone}),
	s({trig = ";vs", wordTrig = false}, { t("\\varsigma") }, {condition = in_mathzone}),
	s({trig = ";vph", wordTrig = false}, { t("\\varphi") }, {condition = in_mathzone}),
}
