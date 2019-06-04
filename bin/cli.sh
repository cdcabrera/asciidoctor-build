#!/bin/sh
#
#
# main()
#
{
  EXEC="asciidoctor -h"
  TEST=false
  FILES="adoc,asc,md"
  WATCH=false

  while getopts f:e:tw option;
    do
      case $option in
        f ) FILES=$OPTARG;;
        e ) EXEC="$OPTARG";;
        t ) TEST=true;;
        w ) WATCH=true;;
      esac
  done

  if [ "$TEST" = true ]; then
    asciidoctor -t -dbook -a toc -v -o ../output/helloWorld.html ./data/helloWorld.adoc
  elif [ "$WATCH" = true ]; then
    nodemon -e $FILES --watch ../data --exec "$EXEC"
  else
    $EXEC
  fi
}
