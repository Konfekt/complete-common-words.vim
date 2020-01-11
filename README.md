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

Copy the contents of this repository into the folder that contains your vim configuration files;
it is `~/.vim` on Linux and MacOS and `%USERPROFILE%/vimfiles` on Microsoft Windows.

If you choose to install this plug-in by a plug-in manager, such as [vim-plug](https://github.com/junegunn/vim-plug), please point `g:common_words_dicts_dir` to the path of the plug-in, in this case

```vim
  let s:dotfiles = split(&runtimepath, ',')[0]
  let g:common_words_dicts_dir = s:dotfiles . '/plugged/complete-common-words.vim/dicts'
  unlet s:dotfiles
```


# Related

The [vim-mucomplete](https://github.com/lifepillar/vim-mucomplete) plug-in offers `Tab` completion for Vim's built-in completion methods, see `:help ins-completion` (instead of the more acrobatic `Ctrl-N` and `Ctrl-P`), such as

- keywords in the open buffers,
- keywords in spell check dictionary,
- tags,
- file names, and
- omni completion, see `:help compl-omni`
