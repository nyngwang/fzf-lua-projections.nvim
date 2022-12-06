fzf-lua-projections.nvim
==

fzf-lua-projections.nvim will help you restoring any project session in a breeze
by facilitating my favorite plugin [`ibhagwan/fzf-lua`](https://github.com/ibhagwan/fzf-lua/)
and the new star project [`GnikDroy/projections.nvim`]().

btw, this repo was built with the help of projections.nvim and fzf-lua :)

## Demo.

https://user-images.githubusercontent.com/24765272/205894447-3d6d3726-5085-4e7f-830b-8f99c58a5289.mov


## Requirements.

0. You will need to add this line to your init.lua
  ```lua
  vim.opt.ssop:append({ 'localoptions' })
  ```
1. For `ibhagwan/fzf-lua`: you don't need to add anything for this plugin. :)
2. For `GnikDroy/projections.nvim`: you just need to read the following note.
   - if you use neovim as the editor for terminal interactive `git` commands,
     e.g `git commit` without any argument,
     you have to ensure that you did add the guardian check `vim.fn.argc() == 0`
     as indicated in [README.md of `GnikDroy/projections.nvim`](https://github.com/GnikDroy/projections.nvim#recommended-configuration):
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

## Dependencies

- The dependencies of `ibhagwan/fzf-lua`: https://github.com/ibhagwan/fzf-lua#dependencies
- The dependencies of `GnikDroy/projections.nvim`: (not provided.)


## Compatible with

- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)


## Config. Example.

note: Actually, it's `fzf-lua-projections` requires `GnikDroy/projections.nvim`


```lua
use {
  'GnikDroy/projections.nvim',
  requires = {
    -- add these two lines
    'ibhagwan/fzf-lua',                  -- Customize the menu UI yourself from fzf-lua's setup.
    'nyngwang/fzf-lua-projections.nvim', -- actually, it's that fzf-lua-projections requires projections,
                                         -- I just want to make it compact :)
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

