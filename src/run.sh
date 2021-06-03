#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# ANSI Escape Codeにおける文字、背景、下線の色を24bitカラーで設定するSGRコードを出力する。
# CreatedAt: 2021-06-03
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	COL="$HERE/color24.sh"
	echo "$("$COL" 255,0,0 0,255,0 0,0,255)"
	echo -e "\e[4;$("$COL" 255,0,0 0,255,0 0,0,255)m対象\e[m"
#	echo -e "\e[4;$("$COL" r g b)m対象\e[m"
#	echo -e "\e[4;$("$COL" red green blue)m対象\e[m"
#	echo -e "\e[4;$("$COL" -f red -b green -l blue)m対象\e[m"
#	echo -e "\e[4;$("$COL" -F red -B green -L blue)m対象\e[m"
	echo -e "\e[4;$("$COL" -f 255,0,0 -b 0,255,0 -l 0,0,255)m対象\e[m"
#	echo -e "\e[4;$("$COL" -F 255,0,0 -B 0,255,0 -L 0,0,255)m対象\e[m"
	echo -e "\e[4;$("$COL" 255,0,0)m対象\e[m"
	echo -e "\e[4;$("$COL" 255,0,0 0,255,0)m対象\e[m"
}
Run "$@"
