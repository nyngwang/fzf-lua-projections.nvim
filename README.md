fzf-lua-projections
==

fzf-lua + projections.nvim to help you restoring sessions in a breeze.

## Demo.

TBU.

## Requirements.

1. fzf-lua: no need to add anything for it :)
2. projections
   - if you use neovim as the editor for terminal interactive `git` commands,
     you have to ensure that the guardian check `vim.fn.argc() == 0` is there:

      ```lua
      -- auto-restore on start.
      vim.api.nvim_create_autocmd({ 'VimEnter' }, {
        -- group = 'YOUR_GROUP', -- it's recommended to use augroup.
        pattern = '*',
        callback = function ()
          if -- neovim is not start by `nvim some_arg` or `git commit`.
            vim.fn.argc() == 0 then
            require('projections.session').restore(vim.loop.cwd())
          end
        end
      })
      ```

## Config. Example.


```lua
use {
  'GnikDroy/projections.nvim',
  requires = {
    'nyngwang/fzf-lua-projections.nvim', -- add this line
  },
  config = function ()
    require('projections').setup {
      -- ...
      store_hooks = {
        pre = function ()
          vim.cmd('tabd Neotree close')
          vim.cmd('tabn')
        end,
        -- ...
      },
    }
    -- just setup your `autocmd`s for projections.
    -- ...
  end
}
```




