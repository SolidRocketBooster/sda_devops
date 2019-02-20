OBJECT=$1
EDITORS=(vim nano emacs)

if [ -d $OBJECT ]; then
	cd $OBJECT
elif [ -f $OBJECT ]; then
	select opt in ${EDITORS[@]}; do
		case $opt in
			"vim" ) vim $OBJECT ;;
			"nano" ) nano $OBJECT ;;
			"emacs" ) emacs -nw $OBJECT ;;
		esac
	done
else
	echo "$OBJECT is not valid"
fi
