Homebrew: Documentation Tools
=============================

**WARNING: UNMAINTAINED**

_I no longer use macOS for a desktop/laptop OS, and do not use Homebrew on Linux, so am not in a position to test fixes to this repository._
_Please either fork this (I will link to a maintained fork) or provide patches: I will merge, untested, sane-looking fixes._

These formulae are for Homebrew, a package management system for MacOS.

What is here
------------

Stuff related to documentation building tools, not already in Homebrew.

I'm one of the Exim maintainers, and have handed in my Zsh commit bit for
safekeeping but still work on Zsh occasionally.  Both products build their
documentation with tools which are less common than some alternatives.

This repo is to make it easier for me to work on the documentation on macOS.

Anything which catches my fancy but is too obscure for Homebrew, which I
suspect will involve dealing with miscellaneous protocols in various ways.

* Exim tools:
  + `sdop`: Typesetting tool to convert a subset of DocBook XML to PostScript
  + `xfpt`: Convert xfpt markup into DocBook XML
  + You will also need `ghostscript` from homebrew-core, for the `ps2pdf`
    command


How do I install these formulae?
--------------------------------

Just `brew tap philpennock/doctools` and then `brew install <formula>`.

If the formula conflicts with one from mxcl/master or another tap, you can
`brew install philpennock/protocols/<formula>`.


