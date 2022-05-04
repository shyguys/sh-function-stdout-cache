#!/bin/bash
#
# TBD.

# -------------------------------------- BEGIN STDOUT_CACHE -------------------------------------- #

declare STDOUT_CACHE_FILE

STDOUT_CACHE_FILE=""

trap_exit_on() {
  trap 'trap_exit' EXIT
}

trap_exit_off() {
  trap - EXIT
}

trap_exit() {
  rm -rf "$(dirname "${STDOUT_CACHE_FILE}")"
}

cache_stdout_on() {
  exec 3<> /dev/null
  exec 3>&1
  mkdir "$(dirname "${STDOUT_CACHE_FILE}")"
  exec 1> "${STDOUT_CACHE_FILE}"
}

cache_stdout_off() {
  exec 1>&3
  exec 3>&-
}

write_stdout_cache() {
  cat "${STDOUT_CACHE_FILE}"
}

flush_stdout_cache() {
  > "${STDOUT_CACHE_FILE}"
}

# --------------------------------------- END STDOUT_CACHE --------------------------------------- #
