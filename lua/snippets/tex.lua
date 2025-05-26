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

return snippets
