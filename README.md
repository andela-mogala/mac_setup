# My MacBook setup script
I hacked a script together that gets the basic software/packages I need to setup my  Macbook for work.
Its basically a collection of the packages I currently have installed via brew and some
other package managers.

# How to use
- Hopefully the Mac comes preinstalled with ruby and git so you can clone this repo
- Go through the `brew_formulae.txt` file to add or remove formulae as you see fit. All valid formulae in this file will be installed on your machine.
- Run `chmod 777 setup` command from the root directory of this repo
- Start the script by running `./setup ruby=<ruby-version> node=<node-version>`, specifying the version of ruby and nodejs that you want to install. If you don't specify a node version, the latest version of node will be installed.
- Once the script is done, you should have `homebrew`, `rbenv`, `ruby`, `nvm`, `nodejs` and a host of other tools installed through *homebrew* and *XCode command line tools*.

# Contributions
If you find this script useful, feel free to fork it and use as you see fit. If you want to make contributions, PRs are welcome but I do not guarantee that I would attend to them immediately :).
