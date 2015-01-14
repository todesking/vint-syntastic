if exists("g:loaded_syntastic_vim_vint_checker")
    finish
endif
let g:loaded_syntastic_vim_vint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_vim_vint_IsAvailable() abort dict " {{{
	return executable(self.getExec())
endfunction " }}}

function! SyntaxCheckers_vim_vint_GetLocList() abort dict " {{{
    let makeprg = self.getExec() . ' ' . syntastic#util#shexpand('%')
	return SyntasticMake({
	\ 'makeprg': makeprg,
	\ 'errorformat': '%f:%l:%c: %m',
	\ 'returns': [0, 1],
	\ 'env': {'LANG': 'en_us.UTF8'},
	\ })
endfunction " }}}

call g:SyntasticRegistry.CreateAndRegisterChecker({
\ 'filetype': 'vim',
\ 'name': 'vint',
\ })

let &cpo = s:save_cpo
unlet s:save_cpo
