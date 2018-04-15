#!/bin/bash

if [ ! -d  $SIMPATH/FairLogger ];
then
  cd $SIMPATH
  git clone $FAIRLOGGER_LOCATION
fi

checkfile=$SIMPATH_INSTALL/bin/loggerTest

if (not_there FairLogger $checkfile);
then
  cd FairLogger
  git checkout $FAIRLOGGER_VERSION
  if [ ! -d  build ];
  then
    mkdir build
  fi
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$SIMPATH_INSTALL ..
  $MAKE_command -j$number_of_processes install
fi

cd $SIMPATH
return 1