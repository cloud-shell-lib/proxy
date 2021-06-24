#!/bin/bash

# 设置新的端口号
P1=$1

# 记住端口号，下次无需再次输入
PORT=""

function export_code() {
  export http_proxy="http://127.0.0.1:$PORT"
  export HTTP_PROXY="http://127.0.0.1:$PORT"
  export https_proxy="http://127.0.0.1:$PORT"
  export HTTPS_PROXY="http://127.0.0.1:$PORT"
}

function set_port() {
  case $P1 in
    '')
      echo '> 设置端口号格式为：「proxy 端口号」' 
      ;;
    *)
      sudo sed -i "" "s/^PORT=\([^,]\{1,\}\)/PORT=\"$P1\"/g" '/usr/local/bin/proxy' &&
      PORT=$P1 && P1='' && start
      ;;
  esac
}

function start() {
  case $P1 in
    '')
      case $PORT in
        '')
          set_port ;;
        *)
          export_code && printf "\n> Proxy: \033[32m%s$PORT\033[0m\n\n" 'http://127.0.0.1:' ;;
      esac
      ;;
    *)
      set_port ;;
  esac
}

start
