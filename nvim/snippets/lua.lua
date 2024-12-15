local ls = require('luasnip')

ls.snippets = {
  lua = {
    ls.parser.parse_snippet("func", "function ${1:function_name}(${2:args})\n  ${0}\nend"),
  },
}
