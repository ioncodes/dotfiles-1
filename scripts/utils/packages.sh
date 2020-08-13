#!/bin/bash

. ${UTILS_PATH}/path.sh

function aptUpdate {
  sudo apt update >> $LOG_FILE 2>&1
}

function aptInstall {
  dpkg -l $1 &> /dev/null

  if [ $? -ne 0 ]; then
    info ">>> Installing ${1}"
    sudo apt-get install -y $1 >> $LOG_FILE 2>&1
  else
    warning ">>> Already installed: ${1}"
  fi
}

function aptUpgrade {
  info ">>> Upgrading ${1}"
  sudo apt-get -y --only-upgrade install $1 >> $LOG_FILE 2>&1
}

function snapInstall {
  snap list $1 &> /dev/null

  if [ $? -ne 0 ]; then
    info ">>> Installing: ${1}"
    sudo snap install $1 $2 >> $LOG_FILE 2>&1
  else
    warning ">>> Already installed: ${1}"
  fi
}