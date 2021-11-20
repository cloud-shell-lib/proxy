#!/bin/bash

# 设置新的端口号
P1=$1

# 记住端口号，下次无需再次输入
PROXY_PORT=""

function export_code() {
  PROXY=http://127.0.0.1:$PROXY_PORT
  ALL_PROXY="export http_proxy=\"$PROXY\"; export HTTP_PROXY=\"$PROXY\"; export https_proxy=\"$PROXY\"; export HTTPS_PROXY=\"$PROXY\""
  echo $ALL_PROXY | pbcopy
}

function echo_proxy() {
  echo `pbpaste`
  echo '代码已复制到剪切板！'
}

function set_port() {
  case $P1 in
    '') echo '> 设置端口号格式为：「proxy 端口号」' ;;
    'echo') echo_proxy ;;
    *)
      sudo sed -i "" "s/^PROXY_PORT=\([^,]\{1,\}\)/PROXY_PORT=\"$P1\"/g" '/usr/local/bin/proxy' &&
      PROXY_PORT=$P1 && P1='' && start
      ;;
  esac
}

function start() {
  case $P1 in
    '')
      case $PROXY_PORT in
        '')
          set_port ;;
        *)
          export_code && echo_proxy ;;
      esac
      ;;
    *)
      set_port ;;
  esac
}

start
