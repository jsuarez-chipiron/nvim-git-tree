local v = vim.api.nvim_call_function("substitute", {"pepe",".*\\(p\\).*", "\\U\\1", "g"})
print(v)

local v2 = vim.fn.substitute("pepe",".*\\(p\\).*", "\\U\\1", "g")
print(v2)

