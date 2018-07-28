#!/bin/sh
##########################################
#----------------------------------------#
# Star Package Builder - Travis CI Start #
#----------------------------------------#
##########################################
# Heavily Influenced from Ivandavidov's Travis Control

set -e

sudo apt-get -qq update

./starlinux.sh

set +e
