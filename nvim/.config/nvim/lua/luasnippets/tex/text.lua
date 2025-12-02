return {
    s({ trig = "document" },
        fmta(
            [[
            \documentclass{article}
            \title{<>}
            \author{<>}
            \input{~/university/preamble.tex}

            \begin{document}
            \maketitle

            <>

            \end{document}
            ]],
            {
                i(1),
                i(2, "Romain Malice"),
                i(0)
            }
        )
    )
}, {
    s({ trig = "txi" }, { t("\\textit{"), i(1), t("}") })
}
