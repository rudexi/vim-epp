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

## Installing with VIM 8 package system

```
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/rudexi/vim-epp ~/.vim/pack/plugins/start/vim-epp
```

## Using subsyntax

If you want to have syntax coloration for the language under the epp, you need
to define put `epp_subtype=<mytype>` in a comment withing the first 5 lines of
your template.

Example:

```yaml
# epp_subtype=yaml
---
mykey: "<%= $my_module::mykey %>"
```

If you're using epp variables, you might want to put inside a comment within
the epp escape:

```yaml
<%-| # epp_subtype=yaml
    String $mykey,
|-%>
---
mykey: "<%= $mykey %>"
```
