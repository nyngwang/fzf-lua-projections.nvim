fzf-lua-projections.nvim
==

fzf-lua-projections.nvim will help you restoring any project session in a breeze
by facilitating my favorite plugin fzf-lua and the new star projections.nvim.

## Demo.

TBU.


## Requirements.

1. fzf-lua: no need to add anything for it :)
2. projections: just a note below.
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


## Can work with

- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)


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
          -- if you use neo-tree.nvim, add these two lines to the `pre` of `store_hooks`.
          vim.cmd('tabd Neotree close')
          vim.cmd('tabn')
          -- ...
        end,
        -- ...
      },
    }
    -- just setup your `autocmd`s for projections.
    -- ...
  end
}

-- the only keymap
vim.keymap.set('n', '<Leader>cp', function () require('fzf-lua-p').projects() end, NOREF_NOERR_TRUNC)
```




