#!/bin/sh
##########################################
#----------------------------------------#
# Star Package Builder - Travis CI Build #
#----------------------------------------#
##########################################
# Heavily Influenced from Ivandavidov's Travis Control

set -e

cd ..

sudo apt-get -qq -y install wget make gawk gcc bc xz-utils bison flex xorriso libelf-dev libssl-dev

PACKAGES="protostar"

./spb.sh update
for PACKAGES in ${PACKAGES}
do
	./spb.sh build ${PACKAGES}
	if [ "$?" = "0" ]; then
		echo "${PACKAGE} has been sucessfully built!"
	else
		echo "${PACKAGE} has failed to build."
	fi
done

cat << CEOF

	############################
	#--------------------------#
	# StarLinux has been Built #
	#--------------------------#
	############################
	
CEOF

set +e
	
