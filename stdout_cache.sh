#!/bin/bash
#
# TBD.

__enable_exit_trap() {
  trap "rm -rf ${__TMP_DIR}" "EXIT"
}

__disable_trap() {
  trap "-" "${1}"
}

__enable_stdout_cache() {
  mkdir -p "${__TMP_CACHE_DIR}"
  touch "${__TMP_STDOUT_CACHE_FILE}"

  exec 4>&1
  exec 1>"${__TMP_STDOUT_CACHE_FILE}"
}

__print_stdout_cache() {
  cat "${__TMP_STDOUT_CACHE_FILE}" >&4
}

__disable_stdout_cache() {
  echo > "${__TMP_STDOUT_CACHE_FILE}"

  exec 1>&4
  exec 4>&-
}
