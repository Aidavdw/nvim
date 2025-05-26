local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Load everything from mathjax here too
local snippets = require 'snippets.mathjax'

local function add(snippet)
  table.insert(snippets, snippet)
end

add(s('equation', {
  t { '\\begin{equation}', '\t\\label{eq:' },
  i(1),
  t { '}', '\t' },
  i(2),
  t { '', '\\end{equation}' },
}))

add(s('table2w', {
  -- 'ht' prefers placing it here, but otherwise the top of the page is also OK.
  -- 'H' places it exactly here.
  t { '\\begin{table}[ht]', '\\centering', '\\label{tab:' },
  i(1),
  t { '}', '\\caption{' },
  i(2),
  t { '}', '\\begin{tabular}{lc}\\toprule', '    & ' },
  i(3),
  t { ' & ' },
  -- Can add a \cmidrule for if you you have a multi-layer heading and need a small center line here too
  i(4),
  t { ' \\\\', '\\midrule', '% copy-paste the line under here for how many lines you need.', ' ' },
  i(5),
  t { ' & ' },
  i(6),
  t { ' & ' },
  i(7),
  t { ' \\\\', '\\bottomrule', '\\end{tabular}', '\\end{table}' },
}))

add(s('table3w', {
  t { '\\begin{table}[ht]', '\\centering', '\\label{tab:' },
  i(1),
  t { '}', '\\caption{' },
  i(2),
  t { '}', '\\begin{tabular}{lcs}\\toprule', '    & ' },
  i(3),
  t { ' & ' },
  i(4),
  t { ' & ' },
  -- Can add a \cmidrule for if you you have a multi-layer heading and need a small center line here too
  i(5),
  t { ' \\\\', '\\midrule', '% copy-paste the line under here for how many lines you need.', ' ' },
  i(6),
  t { ' & ' },
  i(7),
  t { ' & ' },
  i(8),
  t { ' & ' },
  i(9),
  t { ' \\\\', '\\bottomrule', '\\end{tabular}', '\\end{table}' },
}))

-- There is a rather complex script that automatically does latex tables.
-- Dynamic latex table, taken from https://github.com/L3MON4D3/LuaSnip/wiki/Misc#dynamicnode-with-user-input

return snippets
