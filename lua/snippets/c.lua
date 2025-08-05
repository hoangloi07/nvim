local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define C snippets
ls.add_snippets("c", {
  -- main function snippet
  s("main", {
    t({ "#include <stdio.h>", "", "", "int main(int argc, char *argv[]) {", "    " }),
    -- i(1, "// code here"),
    t({ "", "    return 0;", "}" }),
  }),

})
