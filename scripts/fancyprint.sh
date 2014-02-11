#!/bin/sh

read var1 var2 <<< "$1"

case $var1 in
	AR)       var1="\e[33;1mAR      \e[0m" ;;
	CC)       var1="\e[32;1mCC      \e[0m" ;;
	GENLNK)   var1="\e[32;1mGENLNK  \e[0m" ;;
	DIR)      var1="\e[35;1mDIR     \e[0m" ;;
	CLEAN)    var1="\e[31;1mCLEAN   \e[0m" ;;
	OBJDUMP)  var1="\e[36;1mOBJDUMP \e[0m" ;;
	LD)       var1="\e[33;1mLD      \e[0m" ;;
	MAP)      var1="\e[33;1mMAP     \e[0m" ;;
	SIZE)     var1="\e[36;1mSIZE    \e[0m" ;;
	*) ;;
esac

printf "  $var1 $var2\n"
