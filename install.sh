#!env /bin/sh
DEST_DIR=../dummy
OVERWRITE_ALL=false
for file in `find . -depth 1 -and -not -iname '.*'`; do 
  current_name=.`basename $file`;
  should_link=true
  # TODO handle excluded names
  if [ -e $DEST_DIR/$current_name ]; then
			if [  $OVERWRITE_ALL == false  ]; then
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
  if [ $should_link == true ]; then
		ln -s -r -f  $file $DEST_DIR/$current_name
		echo "Linking $current_name"
	fi
done;