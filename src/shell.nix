{ pkgs ? import <nixpkgs> {} }:

let
  # python = pkgs.python39;
  # pypackage = pkgs.python39Packages;
  # pythonPackages = python.buildEnv.override {
  #   extraLibs = [
  #     pypackage.numpy
  #     pypackage.matplotlib
  #     pypackage.pandas
  #     pypackage.jupyter
  #   ];
  # };
  texPackages = pkgs.texlive.combined.scheme-full;
  inkscape = pkgs.inkscape;
  # RPackages = pkgs.rWrapper.override {
  #   packages = with pkgs.rPackages;
  #     [
  #       tidyverse
  #       quantities
  #       tikzDevice
  #       ggtikz
  #     ];
  # };
in
      
pkgs.mkShell {
  buildInputs = [
    # pythonPackages
    texPackages
    # RPackages
    pkgs.gnuplot
    inkscape
  ];
}
