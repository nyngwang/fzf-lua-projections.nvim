if vim.fn.has("nvim-0.7") == 0 then
  return
end

if vim.g.loaded_fzf_lua_p ~= nil then
  return
end

require('fzf-lua-p')

vim.g.loaded_fzf_lua_p = 1
