# epp highligh for vim

I could not find a epp (puppet template language) vim highlight on the internet so I made this one.
Mostly code scavenged and adapted from https://github.com/vim-ruby/vim-ruby/blob/master/syntax/eruby.vim

To make things simple, nested epp are not supported, and the syntax highlight of the underlying language
is not supported either.

Contributions are welcome.

## Installing with Vundle

Simply add the following to your `.vimrc` file:

```vim
Plugin 'rudexi/vim-epp'
```

Once the entry is present, perform the install via `:VundleUpdate`!
