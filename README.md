# $HOME sweet ~/

Common shell stuff, dotfiles and little utilities.

All the dotfiles in ~/$HOME are symbolic links with the corresponding file to
this repository. Therefore, I can now modify the files directly in this
repository and the changes will be applied to the system.

![GitHub <-> dotfiles <- ~/$HOME](images/github-dotfiles-home.jpg)

## Installation

Clone the repository and run the bootstrap command:

```shell
git clone git@github.com:arturoherrero/dotfiles.git
sh bootstrap
```

## Update the dotfiles

To update the dotfiles, I can pull the latest change from the repository or I
can just use a shell function anywhere:

```shell
updateme
```
