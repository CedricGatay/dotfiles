#!/usr/bin/env /bin/sh
HOST=`hostname -s`
DEST_DIR=$HOME
OVERWRITE_ALL=false
for file in `ls -1`; do 
  current_name=.`basename $file`;
	if [ $current_name = ".README.rdoc" -o $current_name = ".install.sh" -o $current_name = ".hosts" ]; then
			continue
	fi;
  should_link=true
  if [ -e $DEST_DIR/$current_name ]; then
			if [  "$OVERWRITE_ALL" = "false"  ]; then
				should_link=false
				read -p "Overwrite $current_name [ynaq]" ANSWER
			  case $ANSWER in
					"y") should_link=true; 
								;;
					"n")  
								;;
					"a") should_link=true; OVERWRITE_ALL=true
								;;
					"q") exit
								;;
					*) echo "Sorry wrong answer, exiting"; exit;
								;;
				esac
			fi;

  fi
  if [ "$should_link" = "true" ]; then
		ln -s -r -f  $file $DEST_DIR/$current_name
		echo "Linking $current_name"
	fi
done;
if [ -d hosts/$HOST ]; then
				ln -s -r -f hosts/$HOST $DEST_DIR/.host
				if [ -f $DEST_DIR/.host/install.sh ]; then
						echo "Running custom install script";
						sh $DEST_DIR/.host/install.sh
				fi
fi
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo