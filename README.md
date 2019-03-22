# Plylet

Simply typed lambda calculus - lambda abstractions + let expressions + implicit
coercions.

Intended as a type theory for a small, sub-Turing, high-level build
configuration language: that is, the build is described from a thousand foot
view, which has to be translated by some knowledgeable interpreter into an
executable build plan (e.g. one runnable with Ninja). The idea here is to
provide, from a finite static set of built in functions and types, the ability
to within those bounds compose a variety of builds. This allows someone to
create a build system that is not intended to be particularly generic, while
still providing a reasonable level of composable configurability. An example
use-case would be a organization with a large number of builds, that have
a certain amount of diversity, and thus desire to provide a build system that
allows people staying on the beaten path of what's been done at the
organization to quickly stand up builds, or configure existing ones, within the
bounds of what is interesting to that organization.
