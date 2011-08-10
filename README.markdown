# Generic configuration files or "dotfiles" go here

## Background
After moving from Snow Leopard to Lion and a fresh install, I got rid of
all the old settings that I had borrowed and patched and started from
scratch (while referring to the old.)

This is my home git tree. 
`cd && git init `

To start with I have ignored everything in the
repository. This way only the stuff I manually add gets added.
`echo * >> ~/.git/info/exclude`

This README.markdown is the first file added. Subsequent files will be added one by one and documented.

```
git add README.markdown
git status
git commit -m "Checked in README"
```

Now your turn!
