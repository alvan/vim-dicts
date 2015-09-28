" == "acomment" == {{{
"
"          File:  dicts.vim
"        Author:  Alvan
"      Modifier:  Alvan
"      Modified:  2015-09-28
"
" --}}}
"
if exists("g:loaded_dicts")
    finish
endif
let g:loaded_dicts = "0.9"

if !exists('g:dict_spec')
    let g:dict_spec = {}
endif

if !empty(g:dict_spec)
    for name in keys(g:dict_spec)
        let list = g:dict_spec[name]
        for dict in list
            for path in split(globpath(&rtp, 'dicts/' . dict .'.txt'), "\n")
                if path != ''
                    exec "au Filetype,BufRead,BufNewFile " . name . " setlocal dictionary+=" . path
                endif
            endfor
        endfor
    endfor
endif
