local line_begin = require("luasnip.extras.expand_conditions").line_begin

local table_node = function(args)
    local tabs = {}
    local count
    table = args[1][1]:gsub("%s", ""):gsub("|", "")
    count = table:len()
    for j = 1, count do
        local iNode
        iNode = i(j)
        tabs[2 * j - 1] = iNode
        if j ~= count then
            tabs[2 * j] = t " & "
        end
    end
    return sn(nil, tabs)
end

local rec_table = function()
    return sn(nil, {
        c(1, {
            t({ "" }),
            sn(nil, { t { "\\\\", "" }, d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) })
        }),
    });
end

return {
    s({ trig = "figure", condition = line_begin },
        fmta(
            [[
            \begin{figure}
                \centering
                \includegraphics[width=0.5\linewidth]{<>}
                \caption{<>}
                \label{fig:<>}
            \end{figure}
            ]],
            { i(1, "Image file"), i(2, "Caption"), i(3, "Label") }
        )
    ),
    s("table",
        fmta(
            [[
            \begin{table}
                \centering
                \begin{tabular}{<>}
                    <>
                    <>
                \end{tabular}
                \caption{<>}
                \label{tab:<>}
            \end{table}
            ]],
            {
                i(1, "0"),
                d(2, table_node, { 1 }, {}),
                d(3, rec_table, { 1 }),
                i(4, "Caption"),
                i(5, "Label"),
            }
        )
    ),
}, {

    -- General
    s({ trig = "beg", condition = line_begin },
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            { i(1), i(2), rep(1) }
        )
    ),

    -- Equations
    s("mk", fmta("\\(<>\\)", { i(1) })),
    s("dm",
        fmta(
            [[
            \begin{equation*}
                <>
            \end{equation*}
            ]],
            { i(1) }
        )
    ),

    -- Useful Overleaf stuff
}
