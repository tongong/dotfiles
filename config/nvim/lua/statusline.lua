-- inspired by: https://nihilistkitten.me/nvim-lua-statusline/
--              https://elianiva.my.id/post/neovim-lua-statusline
--              lightline

-- colorscheme
local c_highlight  = 3 -- yellow
local c_grey_light = 8
local c_grey_dark  = 237
local c_white      = 15

local function highlight(group, fg, bg)
    vim.cmd("highlight " .. group .. " ctermfg=" .. fg .. " ctermbg=" .. bg)
end
function status_line_highlights()
    vim.cmd("highlight StatusLine cterm=None ctermfg=15 ctermbg=None")
    highlight("StatusHighlight", c_grey_dark, c_highlight)
    highlight("StatusLight",     c_white,     c_grey_light)
    highlight("StatusDark",      c_highlight, c_grey_dark)
    highlight("StatusNone",      "None",      "None")
end

local function get_mode()
    local modes = {
        [ 'n']  = 'NORMAL',  [ 'no'] = 'N-PENDING', [ 'v']  = 'VISUAL',
        [ 'V']  = 'V-LINE',  [ ''] = 'V-BLOCK',   [ 's']  = 'SELECT',
        [ 'S']  = 'S-LINE',  [ ''] = 'S-BLOCK',   [ 'i']  = 'INSERT',
        [ 'ic'] = 'INSERT',  [ 'R']  = 'REPLACE',   [ 'Rv'] = 'V-REPLACE',
        [ 'c']  = 'COMMAND', [ 'cv'] = 'VIM-EX ',   [ 'ce'] = 'EX',
        [ 'r']  = 'PROMT',   [ 'rm'] = 'MORE',      [ 'r?'] = 'CONFIRM',
        [ '!']  = 'SHELL',   [ 't']  = 'TERMINAL',
    }
    local mode = vim.api.nvim_get_mode()
    if mode == nil then
        return "?"
    else
        return modes[mode.mode]
    end
end

function status_line(active)
    local active_highlight = "%#StatusHighlight#"
    if active == 0 then
        active_highlight = "%#StatusDark#"
    end
    return table.concat {
        active_highlight,
        " ", get_mode(), " ",
        "%#StatusLight#",
        " %f ",
        "%#StatusNone#",
        "%=",
        "%#StatusLight#",
        " %p%% ",
        active_highlight,
        " %l:%c "
    }
end

status_line_highlights()
vim.o.statusline = "%!v:lua.status_line(0)"

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line(1)
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line(0)

  au FocusGained * setlocal statusline=%!v:lua.status_line(1)
  au FocusLost   * setlocal statusline=%!v:lua.status_line(0)
  au User GoyoLeave nested lua status_line_highlights()
  augroup END
]], false)
