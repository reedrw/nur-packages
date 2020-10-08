#!/usr/bin/env bash
nix-prefetch --list
nix-prefetch --list --deep
nix-prefetch hello --autocomplete
nix-prefetch fetchFromGitHub --help
nix-prefetch hello
nix-prefetch hello --hash-algo sha512
nix-prefetch hello.src
nix-prefetch 'let name = "hello"; in pkgs.${name}'
nix-prefetch 'callPackage (pkgs.path + /pkgs/applications/misc/hello) { }'
nix-prefetch --file 'builtins.fetchTarball "channel:nixos-unstable"' hello
nix-prefetch hello_rs.cargoDeps --fetcher '<nixpkgs/pkgs/build-support/rust/fetchcargo.nix>'
nix-prefetch hello_rs.cargoDeps
nix-prefetch '(callPackage (import hello_rs.src) { }).cargoDeps'
nix-prefetch rsync --index 0
nix-prefetch fetchurl --url mirror://gnu/hello/hello-2.10.tar.gz
nix-prefetch '{ pkgs ? import <nixpkgs> { } }: pkgs.fetchurl' --url mirror://gnu/hello/hello-2.10.tar.gz
nix-prefetch kore --fetchurl
nix-prefetch fetchurl --urls --expr '[ mirror://gnu/hello/hello-2.10.tar.gz ]'
nix-prefetch '{ x }: x' --arg x fetchurl --url mirror://gnu/hello/hello-2.10.tar.gz
nix-prefetch '{ name }: pkgs.${name}' --argstr name fetchurl --url mirror://gnu/hello/hello-2.10.tar.gz
nix-prefetch fetchurl --input nix <<< '{
  urls = [ mirror://gnu/hello/hello-2.10.tar.gz ];
}'
nix-prefetch hello --eval '{ prefetcher, ... }: toJSON prefetcher.args'
nix-prefetch hello --output nix
nix-prefetch hello --output json
nix-prefetch hello --output shell
nix-prefetch --help
nix-prefetch --version
