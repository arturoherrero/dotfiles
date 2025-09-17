# $HOME sweet ~/

Personal development setup with shell configurations, dotfiles, and utilities.

The dotfiles are symlinked from this repository to the home directory,
so the changes here automatically apply to the system.

![GitHub <-> dotfiles <- ~/$HOME](images/github-dotfiles-home.jpg)

## Before starting

* Scaled display: System Preferences -> Displays.
* SSH setup: Copy `~/.ssh/config` and private keys.

## Prerequisites

Install Homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Git:

```shell
brew install git
```

Create development directory:

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

This was made by [Arturo Herrero][1] under the MIT License.


[1]: https://arturoherrero.com/
