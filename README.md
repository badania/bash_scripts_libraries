bash_scripts_libraries
======================

A collection of Bash scripts, frameworks and function libraries


## For all scripts

The scripts require various versions of Bash, usually at least version 3, but
some of the functions in `mik_Bashlib` may require Bash 4.

APART from when it is a Bash library, like `mik_Bashlib`, do the following:

Make the script executable (`chmod u+x`), place it in a `$PATH` location, or 
from its containing directory run it as

    ./scriptname
    
## build_python

For Debian/Ubuntu based systems

A build script to compile any Python version, past or development, and safely install it in
/opt away from the package manager. However, for any versions below 2.7, you will need to install
the necessary build-deps manually.
    
## eduke32_build

For Debian/Ubuntu based systems.

A build script for [eduke32](http://www.eduke32.com). No parameters, just
run to compile eduke32. See [the wiki](http://wiki.eduke32.com/wiki/Building_EDuke32_on_Linux)
if you need to specify any optimisations, tweaks on the make command-line.

## stellarium_build     

For Debian/Ubuntu based systems.

A build script for [Stellarium](http://www.stellarium.org) planetarium software.
It requires two parameters; the link for the most recent version from sourceforge and the
sha1 from sourceforge. Both must be quoted when given on the command-line, e.g.

    ./stellarium_build 'http://sourceforge.net/projects/stellarium/files/Stellarium-sources/0.12.2/stellarium-0.12.2.tar.gz' '35752a24bdeb461b9c16e8533b13689b05a87105'

## quiz

A framework for a quiz using arrays, counters, conditionals, etc in Bash.
The current example quiz concerns the Ubuntu codenames, but it could be used
for anything or even for something else other than a quiz such as an install
or diagnostic program that takes a response and does something, then continues
to the next until all the set tasks are finished.

## mik_bashlib

Do NOT make this library executable; source it from your Bash dotfiles.

This is my collection of Bash functions, which can be sourced by your own `~/.bashrc`.
Place in your `~/.bashrc` the following. The `.` is the source command after the `&&`.

    bash_lib=$HOME/whatever/the/location/is

    [[ -f ${bash_lib} ]] && . "${bash_lib}"
    
## .bash_aliases

This is my general bash aliases.
 
## .bashrc

General settings, both standard and my custom ones
 
## Bugs

Report to [github](https://github.com/Exactus29/bash_scripts_libraries/issues) or email <exactus29@gmail.com>

