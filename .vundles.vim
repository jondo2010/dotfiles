"set nocompatible off
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"" Vundle itself
Bundle 'gmarik/vundle'

"" Syntax
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'vim-scripts/xml.vim'
Bundle 'groenewege/vim-less'
Bundle 'sukima/xmledit'
Bundle 'peterhoeg/vim-qml'
Plugin 'rust-lang/rust.vim'

"" Editing, completion, & whatnot
Bundle 'tsaleh/vim-supertab'
""Bundle 'vim-scripts/taglist.vim'
""Bundle 'vim-scripts/TaskList.vim'
""Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/python.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'

Bundle 'godlygeek/tabular'

Bundle 'Twinside/vim-modelica'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'vim-scripts/AnsiEsc'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Valloric/YouCompleteMe'

