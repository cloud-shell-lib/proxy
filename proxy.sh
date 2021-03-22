#!/bin/bash

P1=$1

function copy_code() {
  export http_proxy="http://127.0.0.1: $P1"
  export HTTP_PROXY="http://127.0.0.1: $P1"
  export https_proxy="http://127.0.0.1: $P1"
  export HTTPS_PROXY="http://127.0.0.1: $P1"
}

function start() {
	case $P1 in
    '')
      echo '> 格式为：「proxy 端口号」'
      ;;
    *)
      copy_code && echo '> Success!'
      ;;
  esac
}

start $1
