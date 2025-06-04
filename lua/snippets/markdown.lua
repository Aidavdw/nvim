local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

local function add(snippet)
  table.insert(snippets, snippet)
end

add(s('alias', {
  t { '---', 'aliases:', '  - ' },
  i(1),
  t { '', '---' },
}))

add(s('checkbox', {
  t { '- [ ] ' },
}))

return snippets
