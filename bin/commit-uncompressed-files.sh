if [[ "$TRAVIS_PULL_REQUEST" == "false" && "$TRAVIS_JOB_NUMBER" == *.1 ]]; then
	
  	echo -e "Checking to make sure files are properly compressed.\n"

	v1=`find ReduxCore -type f | sort -u | xargs cat | md5sum`

	grunt compileCSS
	grunt compileJS
	
	v2=`find ReduxCore -type f | sort -u | xargs cat | md5sum`

	if [ "$v1" == "$v1" ]
	then
	    echo "All files are properly compressed."
	else
		echo "Files are not the same. Committing back to the repo."
		grunt gh-pages:compressedFiles
	fi

fi
