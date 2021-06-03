#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ANSI Escape Codeにおける文字、背景、下線の色を24bitカラーで設定するSGRコードを出力する。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
# echo -e "\e[38;2;R;G;Bm対象\e[m"
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	SGR=(); PARAMS=(); VALUES=(); COLOR_SPACE_ID=2;
	CommaToSemiCollon() { echo "$1" | sed -e s/\,/\;/g; }
	SetArray() { SGR+=($1); PARAMS+=("$(CommaToSemiCollon "$2")"); }
	while getopts :f:b:l:x OPT; do
	case $OPT in
		f) SetArray 38 $OPTARG;;
		b) SetArray 48 $OPTARG;;
		l) SetArray 58 $OPTARG;;
		x) echo "59"; exit;;
		*) eval "echo \"$(cat "$HERE/help.txt")\""
	esac
	done
	shift $((OPTIND - 1))
	[ 1 -le $# ] && SetArray 38 $1;
	[ 2 -le $# ] && SetArray 48 $2;
	[ 3 -le $# ] && SetArray 58 $3;
	for i in `seq 0 $((${#SGR[@]} - 1))`; do { VALUES+=("${SGR[i]};$COLOR_SPACE_ID;${PARAMS[i]}"); } done;
	echo "$(IFS=";"; echo "${VALUES[*]}")"
}
Run "$@"
