# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  actions-cli = pkgs.callPackage ./pkgs/actions-cli { };
  artwiz-lemon = pkgs.callPackage ./pkgs/artwiz-lemon { };
  bitwarden-rofi-patched = pkgs.callPackage ./pkgs/bitwarden-rofi { };
  comma = pkgs.callPackage ./pkgs/comma { }; # From https://github.com/Shopify/comma/pull/7
  picom-next-ibhagwan = pkgs.callPackage ./pkgs/picom-next-ibhagwan { };
  r2mod_cli = pkgs.callPackage ./pkgs/r2mod_cli { };
  scientifica = pkgs.callPackage ./pkgs/scientifica { };
  shticker-book-unwritten = pkgs.callPackage ./pkgs/shticker-book-unwritten { };
  teletype = pkgs.callPackage ./pkgs/teletype { };
  uwuify = pkgs.callPackage ./pkgs/uwuify { };
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
