# Neovim Config

![pic](https://drive.google.com/file/d/16D2pWDcIDJ__MfELK6YptkimxikdmXSe/view?usp=sharing)

---

It's a simple, yet very powerful **Neovim** setup. Designed for programming in `C/C++` and `Java`.

---

## Plugins used in this configuration

- [alpha](https://github.com/goolord/alpha-nvim)
- [miasma](https://github.com/xero/miasma.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

I'm using a native lsp setup :D and I use [Lazy](https://www.lazyvim.org/) as my plugin manger.

---

## How to set it yourself

First you will need to clone this repo into `~/.config/nvim/`


```bash
git clone https://github.com/ahmed-abdelqawi/nvim-config ~/.config/nvim/
```

After you clone the repo to it's place, you will need to install the lsp servers using your package manger. e.g `pacman` for Arch, `brew` for Mac OS and what evre Windows is using these days :D

For Arch, btw.


```bash
sudo pacman -S clang lua-language-server pyright
yay -S jdtls # that's for Java
```


- **Now you should be good to go and make sure to have fun :)**
