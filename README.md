By `set complete+=k` and `set dictionary+=spell`, the key combinations `Ctrl-N` and `Ctrl-P` complete words to those in the spell check dictionary.
However, the list of suggested words to complete to is sorted by length and alphabetical position, whereas commonly a common word is completed, and therefore should be among the first completion suggestions.

To this end, this Vim plug-in prepends a corresponding dictionary of common words (like [these](http://crr.ugent.be/programs-data/subtitle-frequencies)) to that of the spell check dictionary for

- English,
- Portuguese,
- Spanish,
- Italian,
- German, and
- French.

# Installation

Copy the files of this repository, that is, its folders `plugin/` and `dicts/`, into the folder of your vim configuration files, which is `~/.vim` on Linux and MacOS and `%USERPROFILE%/vimfiles` on Microsoft Windows.

If you choose to install this plug-in by a plug-in manager (for example, if [vim-plug](https://github.com/junegunn/vim-plug), then by adding `Plug 'konfekt/complete-common-words.vim'` to your `vimrc`), then please point `g:common_words_dicts_dir` to the path of the plug-in, in the case of `vim-plug`

```vim
  let s:dotfiles = split(&runtimepath, ',')[0]
  let g:common_words_dicts_dir = s:dotfiles . '/plugged/complete-common-words.vim/dicts'
  unlet s:dotfiles
```

# Recommendations

To automatically detect the spellcheck language of a buffer, install the plug-in [vim-DetectSpellLang](https://github.com/Konfekt/vim-DetectSpellLang).

The [vim-mucomplete](https://github.com/lifepillar/vim-mucomplete/wiki/Suggested-Setup-for-Prose) plug-in offers `Tab` completion (instead of the more acrobatic `Ctrl-N` and `Ctrl-P`) for Vim's built-in completion methods (see `:help ins-completion`) such as

- keywords in the open buffers,
- keywords in (spell check) dictionaries,
- tags,
- file names, and
- omni completion, see `:help compl-omni`
