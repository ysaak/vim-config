
let g:tex_flavor='latex'

let g:LustyJugglerAltTabMode = 1

let g:DoxygenToolkit_authorName="Damien ROTH"

let g:CSApprox_loaded = 1
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'

"disable real time auto-completion at startup
" let g:acp_CompleteoptPreview = 1
let g:acp_enableAtStartup = 0

"show function prototype
let OmniCpp_ShowPrototypeInAbbr = 1

"tell Vimux to execute its commands in the nearest
"inactive pane rather than creating a new one.
let g:VimuxUseNearestPane = 1

" Zen-coding
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}
