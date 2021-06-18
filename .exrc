let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(coc-snippets-expand-jump) coc#_insert_key('notify', 'snippets-expand-jump', 1)
inoremap <silent> <expr> <Plug>(coc-snippets-expand) coc#_insert_key('notify', 'snippets-expand', 1)
inoremap <Plug>(emmet-merge-lines) =emmet#util#closePopup()=emmet#mergeLines()
inoremap <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
inoremap <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
inoremap <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
inoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
inoremap <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
inoremap <Plug>(emmet-image-encode) =emmet#util#closePopup()=emmet#imageEncode()
inoremap <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
inoremap <Plug>(emmet-move-prev) =emmet#util#closePopup()=emmet#moveNextPrev(1)
inoremap <Plug>(emmet-move-next) =emmet#util#closePopup()=emmet#moveNextPrev(0)
inoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
inoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
inoremap <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
inoremap <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
inoremap <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', 'insert')
inoremap <silent> <SNR>51_AutoPairsReturn =AutoPairsReturn()
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <Plug>CocRefresh =coc#_complete()
inoremap <silent> <expr> <C-Space> coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\"
vnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(0) : "\"
nnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(0) : "\"
vnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(1) : "\"
nnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(1) : "\"
nnoremap  :tabp
nnoremap  :tabn
xmap <nowait>  <Plug>(VM-Find-Subword-Under)
nmap <nowait>  <Plug>(VM-Find-Under)
xmap <silent>  <Plug>(coc-range-select)
nmap <silent>  <Plug>(coc-range-select)
vmap c <Plug>(emmet-code-pretty)
nmap m <Plug>(emmet-merge-lines)
nmap A <Plug>(emmet-anchorize-summary)
nmap a <Plug>(emmet-anchorize-url)
nmap k <Plug>(emmet-remove-tag)
nmap j <Plug>(emmet-split-join-tag)
nmap / <Plug>(emmet-toggle-comment)
nmap I <Plug>(emmet-image-encode)
nmap i <Plug>(emmet-image-size)
nmap N <Plug>(emmet-move-prev)
nmap n <Plug>(emmet-move-next)
vmap D <Plug>(emmet-balance-tag-outword)
nmap D <Plug>(emmet-balance-tag-outword)
vmap d <Plug>(emmet-balance-tag-inward)
nmap d <Plug>(emmet-balance-tag-inward)
nmap u <Plug>(emmet-update-tag)
nmap ; <Plug>(emmet-expand-word)
vmap , <Plug>(emmet-expand-abbr)
nmap , <Plug>(emmet-expand-abbr)
nmap  ca <Plug>NERDCommenterAltDelims
xmap  cu <Plug>NERDCommenterUncomment
nmap  cu <Plug>NERDCommenterUncomment
xmap  cb <Plug>NERDCommenterAlignBoth
nmap  cb <Plug>NERDCommenterAlignBoth
xmap  cl <Plug>NERDCommenterAlignLeft
nmap  cl <Plug>NERDCommenterAlignLeft
nmap  cA <Plug>NERDCommenterAppend
xmap  cy <Plug>NERDCommenterYank
nmap  cy <Plug>NERDCommenterYank
xmap  cs <Plug>NERDCommenterSexy
nmap  cs <Plug>NERDCommenterSexy
xmap  ci <Plug>NERDCommenterInvert
nmap  ci <Plug>NERDCommenterInvert
nmap  c$ <Plug>NERDCommenterToEOL
xmap  cn <Plug>NERDCommenterNested
nmap  cn <Plug>NERDCommenterNested
xmap  cm <Plug>NERDCommenterMinimal
nmap  cm <Plug>NERDCommenterMinimal
xmap  c  <Plug>NERDCommenterToggle
nmap  c  <Plug>NERDCommenterToggle
xmap  cc <Plug>NERDCommenterComment
nmap  cc <Plug>NERDCommenterComment
nnoremap  fh <Cmd>lua require('telescope.builtin').help_tags()
nnoremap  fb <Cmd>lua require('telescope.builtin').buffers()
nnoremap  fs <Cmd>lua require('telescope.builtin').live_grep()
nnoremap  ff <Cmd>lua require('telescope.builtin').find_files{ hidden = true }
nnoremap  fe <Cmd>lua require('telescope.builtin').file_browser()
nnoremap  hw :HopWord
nnoremap  hs :HopPattern
nnoremap  h2 :HopChar2
nnoremap  h1 :HopChar1
nnoremap  ft :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating
nnoremap  fr :FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating ranger
nnoremap  fg :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit
nnoremap  fd :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazydocker
nnoremap <nowait> <silent>  p :CocListResume
nnoremap <nowait> <silent>  s :CocList -I symbols
nnoremap <nowait> <silent>  o :CocList outline
nnoremap <nowait> <silent>  c :CocList commands
nnoremap <nowait> <silent>  e :CocList extensions
nmap  qf <Plug>(coc-fix-current)
nmap  ac <Plug>(coc-codeaction)
nnoremap <nowait> <silent>  a :CocList diagnostics
xmap  a <Plug>(coc-codeaction-selected)
nmap  f <Plug>(coc-format-selected)
xmap  f <Plug>(coc-format-selected)
nmap  rn <Plug>(coc-rename)
nnoremap  nf :NERDTreeFind
nnoremap  nt :NERDTreeToggle
nnoremap  nn :NERDTree
nnoremap  n :NERDTreeFocus
nmap  br <Plug>(coc-references)
nmap  bi <Plug>(coc-implementation)
nmap  bt <Plug>(coc-type-definition)
nmap  bd <Plug>(coc-definition)
nmap  l :wincmd l
nnoremap <nowait> <silent>  k :CocPrev
nnoremap <nowait> <silent>  j :CocNext
nmap  h :wincmd h
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
xmap <nowait> \\c <Plug>(VM-Visual-Cursors)
nmap <nowait> \\gS <Plug>(VM-Reselect-Last)
nmap <nowait> \\/ <Plug>(VM-Start-Regex-Search)
nmap <nowait> \\\ <Plug>(VM-Add-Cursor-At-Pos)
xmap <nowait> \\a <Plug>(VM-Visual-Add)
xmap <nowait> \\f <Plug>(VM-Visual-Find)
xmap <nowait> \\/ <Plug>(VM-Visual-Regex)
xmap <nowait> \\A <Plug>(VM-Visual-All)
nmap <nowait> \\A <Plug>(VM-Select-All)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
xmap a% <Plug>(MatchitVisualTextObject)
omap ac <Plug>(coc-classobj-a)
xmap ac <Plug>(coc-classobj-a)
omap af <Plug>(coc-funcobj-a)
xmap af <Plug>(coc-funcobj-a)
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xmap gr <Plug>ReplaceWithRegisterVisual
nmap grr <Plug>ReplaceWithRegisterLine
nmap gr <Plug>ReplaceWithRegisterOperator
omap ic <Plug>(coc-classobj-i)
xmap ic <Plug>(coc-classobj-i)
omap if <Plug>(coc-funcobj-i)
xmap if <Plug>(coc-funcobj-i)
nnoremap <silent> <Plug>(go-diagnostics) :call go#lint#Diagnostics(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-iferr) :call go#iferr#Generate()
nnoremap <silent> <Plug>(go-alternate-split) :call go#alternate#Switch(0, "split")
nnoremap <silent> <Plug>(go-alternate-vertical) :call go#alternate#Switch(0, "vsplit")
nnoremap <silent> <Plug>(go-alternate-edit) :call go#alternate#Switch(0, "edit")
nnoremap <silent> <Plug>(go-vet) :call go#lint#Vet(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-lint) :call go#lint#Golint(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-metalinter) :call go#lint#Gometa(!g:go_jump_to_error, 0)
nnoremap <silent> <Plug>(go-doc-browser) :call go#doc#OpenBrowser()
nnoremap <silent> <Plug>(go-doc-split) :call go#doc#Open("new", "split")
nnoremap <silent> <Plug>(go-doc-vertical) :call go#doc#Open("vnew", "vsplit")
nnoremap <silent> <Plug>(go-doc-tab) :call go#doc#Open("tabnew", "tabe")
nnoremap <silent> <Plug>(go-doc) :call go#doc#Open("new", "split")
nnoremap <silent> <Plug>(go-def-stack-clear) :call go#def#StackClear()
nnoremap <silent> <Plug>(go-def-stack) :call go#def#Stack()
nnoremap <silent> <Plug>(go-def-pop) :call go#def#StackPop()
nnoremap <silent> <Plug>(go-def-type-tab) :call go#def#Jump("tab", 1)
nnoremap <silent> <Plug>(go-def-type-split) :call go#def#Jump("split", 1)
nnoremap <silent> <Plug>(go-def-type-vertical) :call go#def#Jump("vsplit", 1)
nnoremap <silent> <Plug>(go-def-type) :call go#def#Jump('', 1)
nnoremap <silent> <Plug>(go-def-tab) :call go#def#Jump("tab", 0)
nnoremap <silent> <Plug>(go-def-split) :call go#def#Jump("split", 0)
nnoremap <silent> <Plug>(go-def-vertical) :call go#def#Jump("vsplit", 0)
nnoremap <silent> <Plug>(go-def) :call go#def#Jump('', 0)
nnoremap <silent> <Plug>(go-decls-dir) :call go#decls#Decls(1, '')
nnoremap <silent> <Plug>(go-decls) :call go#decls#Decls(0, '')
nnoremap <silent> <Plug>(go-rename) :call go#rename#Rename(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-sameids-toggle) :call go#guru#ToggleSameIds()
nnoremap <silent> <Plug>(go-whicherrs) :call go#guru#Whicherrs(-1)
nnoremap <silent> <Plug>(go-pointsto) :call go#guru#PointsTo(-1)
nnoremap <silent> <Plug>(go-sameids) :call go#guru#SameIds(1)
nnoremap <silent> <Plug>(go-referrers) :call go#referrers#Referrers(-1)
nnoremap <silent> <Plug>(go-channelpeers) :call go#guru#ChannelPeers(-1)
xnoremap <silent> <Plug>(go-freevars) :call go#guru#Freevars(0)
nnoremap <silent> <Plug>(go-callstack) :call go#guru#Callstack(-1)
nnoremap <silent> <Plug>(go-describe) :call go#guru#Describe(-1)
nnoremap <silent> <Plug>(go-callers) :call go#calls#Callers()
nnoremap <silent> <Plug>(go-callees) :call go#guru#Callees(-1)
nnoremap <silent> <Plug>(go-implements) :call go#implements#Implements(-1)
nnoremap <silent> <Plug>(go-fmt) :call go#fmt#Format(0)
nnoremap <silent> <Plug>(go-imports) :call go#fmt#Format(1)
nnoremap <silent> <Plug>(go-import) :call go#import#SwitchImport(1, '', expand('<cword>'), '')
nnoremap <silent> <Plug>(go-info) :call go#tool#Info(1)
nnoremap <silent> <Plug>(go-deps) :call go#tool#Deps()
nnoremap <silent> <Plug>(go-files) :call go#tool#Files()
nnoremap <silent> <Plug>(go-coverage-browser) :call go#coverage#Browser(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-coverage-toggle) :call go#coverage#BufferToggle(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-coverage-clear) :call go#coverage#Clear()
nnoremap <silent> <Plug>(go-coverage) :call go#coverage#Buffer(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-test-compile) :call go#test#Test(!g:go_jump_to_error, 1)
nnoremap <silent> <Plug>(go-test-func) :call go#test#Func(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-test) :call go#test#Test(!g:go_jump_to_error, 0)
nnoremap <silent> <Plug>(go-install) :call go#cmd#Install(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-generate) :call go#cmd#Generate(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-build) :call go#cmd#Build(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-run-tab) :call go#cmd#RunTerm(!g:go_jump_to_error, 'tabe', [])
nnoremap <silent> <Plug>(go-run-split) :call go#cmd#RunTerm(!g:go_jump_to_error, 'split', [])
nnoremap <silent> <Plug>(go-run-vertical) :call go#cmd#RunTerm(!g:go_jump_to_error, 'vsplit', [])
nnoremap <silent> <Plug>(go-run) :call go#cmd#Run(!g:go_jump_to_error)
vnoremap <silent> <Plug>(coc-snippets-select) :call coc#rpc#notify('doKeymap', ['snippets-select'])
xnoremap <silent> <Plug>(coc-convert-snippet) :call coc#rpc#notify('doKeymap', ['convert-snippet'])
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v')m'gv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
vnoremap <Plug>(emmet-code-pretty) :call emmet#codePretty()
nnoremap <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nnoremap <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nnoremap <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nnoremap <Plug>(emmet-remove-tag) :call emmet#removeTag()
nnoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nnoremap <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nnoremap <Plug>(emmet-image-encode) :call emmet#imageEncode()
nnoremap <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nnoremap <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nnoremap <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
nnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nnoremap <Plug>(emmet-update-tag) :call emmet#updateTag()
nnoremap <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
nnoremap <silent> <Plug>GitGutterPreviewHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterPreviewHunk to <Plug>(GitGutterPreviewHunk)')
nnoremap <silent> <Plug>(GitGutterPreviewHunk) :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterUndoHunk to <Plug>(GitGutterUndoHunk)')
nnoremap <silent> <Plug>(GitGutterUndoHunk) :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
nnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
xnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
xnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterPrevHunk to \<Plug>(GitGutterPrevHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterPrevHunk) &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterNextHunk to \<Plug>(GitGutterNextHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterNextHunk) &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>(GitGutterTextObjectOuterVisual) :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>(GitGutterTextObjectInnerVisual) :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>(GitGutterTextObjectOuterPending) :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>(GitGutterTextObjectInnerPending) :call gitgutter#hunk#text_object(1)
nmap <nowait> <C-Down> <Plug>(VM-Add-Cursor-Down)
nmap <nowait> <C-Up> <Plug>(VM-Add-Cursor-Up)
nmap <nowait> <S-Right> <Plug>(VM-Select-l)
nmap <nowait> <S-Left> <Plug>(VM-Select-h)
nnoremap <silent> <Plug>(VM-Select-BBW) :call vm#commands#motion('BBW', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-gE) :call vm#commands#motion('gE', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-ge) :call vm#commands#motion('ge', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-E) :call vm#commands#motion('E', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-e) :call vm#commands#motion('e', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-B) :call vm#commands#motion('B', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-b) :call vm#commands#motion('b', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-W) :call vm#commands#motion('W', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-w) :call vm#commands#motion('w', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-l) :call vm#commands#motion('l', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-k) :call vm#commands#motion('k', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-j) :call vm#commands#motion('j', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-h) :call vm#commands#motion('h', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Mouse-Column) :call vm#commands#mouse_column()
nmap <silent> <Plug>(VM-Mouse-Word) <Plug>(VM-Left-Mouse)<Plug>(VM-Find-Under)
nmap <silent> <Plug>(VM-Mouse-Cursor) <Plug>(VM-Left-Mouse)<Plug>(VM-Add-Cursor-At-Pos)
nnoremap <silent> <Plug>(VM-Left-Mouse) <LeftMouse>
xnoremap <silent> <Plug>(VM-Visual-Regex) :call vm#commands#find_by_regex(2):call feedkeys('/', 'n')
nnoremap <silent> <Plug>(VM-Slash-Search) @=vm#commands#find_by_regex(3)
nnoremap <silent> <Plug>(VM-Start-Regex-Search) @=vm#commands#find_by_regex(1)
nnoremap <silent> <Plug>(VM-Find-Under) :call vm#commands#ctrln(v:count1)
xnoremap <silent> <Plug>(VM-Visual-Reduce) :call vm#visual#reduce()
xnoremap <silent> <Plug>(VM-Visual-Add) :call vm#commands#visual_add()
xnoremap <silent> <Plug>(VM-Visual-Cursors) :call vm#commands#visual_cursors()
nnoremap <silent> <Plug>(VM-Select-All) :call vm#commands#find_all(0, 1)
nnoremap <silent> <Plug>(VM-Reselect-Last) :call vm#commands#reselect_last()
nnoremap <silent> <Plug>(VM-Select-Cursor-Up) :call vm#commands#add_cursor_up(1, v:count1)
nnoremap <silent> <Plug>(VM-Select-Cursor-Down) :call vm#commands#add_cursor_down(1, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Up) :call vm#commands#add_cursor_up(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Down) :call vm#commands#add_cursor_down(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Word) :call vm#commands#add_cursor_at_word(1, 1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Pos) :call vm#commands#add_cursor_at_pos(0)
xmap <silent> <expr> <Plug>(VM-Visual-Find) vm#operators#find(1, 1)
nnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
vnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
nnoremap <silent> <Plug>ReplaceWithRegisterLine :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine")
nnoremap <silent> <Plug>ReplaceWithRegisterExpressionSpecial :let g:ReplaceWithRegister_expr = getreg('=')|execute 'normal!' v:count1 . '.'
nnoremap <expr> <Plug>ReplaceWithRegisterOperator ReplaceWithRegister#OperatorExpression()
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
onoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Method', 'Function']])
onoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Method', 'Function']])
nnoremap <silent> <Plug>(coc-cursors-position) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'position', 'n'])
nnoremap <silent> <Plug>(coc-cursors-word) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'word', 'n'])
vnoremap <silent> <Plug>(coc-cursors-range) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'range', visualmode()])
nnoremap <silent> <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <silent> <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <silent> <Plug>(coc-float-jump) :call       coc#float#jump()
nnoremap <silent> <Plug>(coc-float-hide) :call       coc#float#close_all()
nnoremap <silent> <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <silent> <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <silent> <Plug>(coc-references-used) :call       CocActionAsync('jumpUsed')
nnoremap <silent> <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <silent> <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <silent> <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <silent> <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <silent> <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <silent> <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <silent> <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <silent> <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <silent> <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <silent> <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <silent> <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <silent> <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction-cursor) :call       CocActionAsync('codeAction',         'cursor')
nnoremap <Plug>(coc-codeaction-line) :call       CocActionAsync('codeAction',         'line')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <silent> <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <silent> <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     '', v:true)
vnoremap <silent> <Plug>(coc-range-select-backward) :call       CocActionAsync('rangeSelect',     visualmode(), v:false)
vnoremap <silent> <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     visualmode(), v:true)
inoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? "\=coc#float#scroll(0)\" : "\<Left>"
inoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? "\=coc#float#scroll(1)\" : "\<Right>"
inoremap <silent> <expr>  pumvisible() ? coc#_select_confirm(): "\u\\=coc#on_enter()\"
imap m <Plug>(emmet-merge-lines)
imap A <Plug>(emmet-anchorize-summary)
imap a <Plug>(emmet-anchorize-url)
imap k <Plug>(emmet-remove-tag)
imap j <Plug>(emmet-split-join-tag)
imap / <Plug>(emmet-toggle-comment)
imap I <Plug>(emmet-image-encode)
imap i <Plug>(emmet-image-size)
imap N <Plug>(emmet-move-prev)
imap n <Plug>(emmet-move-next)
imap D <Plug>(emmet-balance-tag-outword)
imap d <Plug>(emmet-balance-tag-inward)
imap u <Plug>(emmet-update-tag)
imap ; <Plug>(emmet-expand-word)
imap , <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
set helplang=en
set hidden
set pyxversion=3
set runtimepath=~/.config/nvim,~/.config/nvim/plugged/coc.nvim,~/.config/nvim/plugged/nvim-treesitter,~/.config/nvim/plugged/popup.nvim,~/.config/nvim/plugged/plenary.nvim,~/.config/nvim/plugged/telescope.nvim,~/.config/nvim/plugged/tokyonight-vim,~/.config/nvim/plugged/matchtag,~/.config/nvim/plugged/vim-go,~/.config/nvim/plugged/nerdtree,~/.config/nvim/plugged/auto-pairs,~/.config/nvim/plugged/hop.nvim,~/.config/nvim/plugged/vim-airline,~/.config/nvim/plugged/nerdcommenter,~/.config/nvim/plugged/nvim-treesitter-context,~/.config/nvim/plugged/nvim-web-devicons,~/.config/nvim/plugged/ReplaceWithRegister,~/.config/nvim/plugged/vim-floaterm,~/.config/nvim/plugged/vim-hardtime,~/.config/nvim/plugged/vim-visual-multi,~/.config/nvim/plugged/vim-gitgutter,~/.config/nvim/plugged/emmet-vim,~/.config/nvim/plugged/nerdtree-git-plugin,/etc/xdg/nvim,~/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/tmp/.mount_nvim.aZQbOPN/usr/share/nvim/runtime,/tmp/.mount_nvim.aZQbOPN/usr/share/nvim/runtime/pack/dist/opt/matchit,/tmp/.mount_nvim.aZQbOPN/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/plugged/nvim-treesitter/after,~/.config/nvim/plugged/nerdtree-git-plugin/after,~/.config/nvim/after,~/.config/coc/extensions/node_modules/coc-snippets
set scrolloff=3
set secure
set shiftwidth=2
set shortmess=filnxtToOFc
set noshowmode
set showtabline=2
set smartindent
set splitbelow
set splitright
set tabstop=2
set termguicolors
set updatetime=300
set window=94
set nowritebackup
" vim: set ft=vim :
