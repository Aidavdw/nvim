local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

local function add(snippet)
  table.insert(snippets, snippet)
end

-- Okabe-ito hex colour codes
add(s('ito-orange', {
  t { '#E69F00' },
}))
add(s('ito-sky-blue', {
  t { '#56B4E9' },
}))
add(s('ito-bluish-green', {
  t { '#009E73' },
}))
add(s('ito-yellow', {
  t { '#F0E442' },
}))
add(s('ito-blue', {
  t { '#0072B2' },
}))
add(s('ito-vermillion', {
  t { '#D55E00' },
}))
add(s('ito-reddish-purple', {
  t { '#CC79A7' },
}))

return snippets
