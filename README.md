fzf-lua-projections
==

fzf-lua + projections.nvim to help you restoring sessions in a breeze.

## Demo.

TBU.

## Requirements.

1. fzf-lua: no need to add anything for it :)
2. projections
   - if you use neovim as the editor for terminal interactive `git` commands,
     you have to ensure that you have the followiing `autocmd` for projections.nvim,
     since I will not add it for you:

      ```lua
      -- auto-restore on start, but excluding `git commit` and `nvim with_args`.
      vim.api.nvim_create_autocmd({ 'VimEnter' }, {
        -- group = 'YOUR_GROUP', -- it's recommended to use augroup.
        pattern = '*',
        callback = function ()
          if vim.fn.argc() == 0 then
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
    }

    -- fzf-lua-projections.nvim depends on
    -- the following (default) `autocmd`s on projections.nvim.

    -- auto-store on leave/quit neovim in any condition.
    vim.api.nvim_create_autocmd({ 'DirChangedPre', 'VimLeavePre' }, {
      pattern = '*',
      callback = function ()
        require('projections.session').store(vim.loop.cwd())
      end
    })
    -- auto-restore on start, excluding:
    -- 1. Starting neovim with argument(s) `nvim .`.
    -- 2. Using `gm` to start neovim.
    vim.api.nvim_create_autocmd({ 'VimEnter' }, {
      pattern = '*',
      callback = function ()
        if vim.fn.argc() == 0 then
          require('projections.session').restore(vim.loop.cwd())
        end
      end
    })
  end
}
```




