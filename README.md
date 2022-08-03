# $HOME sweet ~/

Common shell stuff, dotfiles and little utilities.

All the dotfiles in ~/$HOME are symbolic links with the corresponding file to
this repository. Therefore, I can now modify the files directly in this
repository and the changes will be applied to the system.

![GitHub <-> dotfiles <- ~/$HOME](images/github-dotfiles-home.jpg)

## Basic

Scaled display: System Preferences -> Displays.

## Prerequisites

Install Homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Git:

```shell
brew install git
```

Create `projects` directory:

```shell
mkdir projects
```

## Installation

Clone the repository:

```shell
cd projects
git clone git@github.com:arturoherrero/dotfiles.git
```

Run the bootstrap command:

```shell
cd dotfiles
sh bootstrap
```

## Update the dotfiles

To update the dotfiles, I can pull the latest change from the repository or I
can just use a shell function anywhere:

```shell
updateme
```

## Custom configuration

Using `system/zcustom.sh` file, I can add any custom configuration that is not
going to be persisted in the repository.


## Who made this?

This was made by Arturo Herrero under the MIT License. Find me on Twitter
[@ArturoHerrero][1].


[1]: https://twitter.com/ArturoHerrero
