#!/bin/sh
NUM=0
REQ="ffmpeg"

# check requirement installation
requirement_check() {
    echo "Checking $1 install ... "

    if [ "$(command -v $1 | grep -o $1)" = "$REQ" ]; then
        echo "Matched, $1 installed! "
    else
        echo "No Match, $1 missing! Exiting..."
        exit
    fi;
}

main() {
# echo \$1 is "$1" # used for testing
case "$1" in
    "-h")
        echo
        echo "Help for compress_with_ffmpeg.sh"
        echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
        echo " Usage:     sh compress_with_ffmpeg [Option] [ARGS...]"
        echo
        echo " ARGS:      Arguments: Names of the to converting files."
        echo "            The files have to be in the same folder, as the script and need to have the filename + file-extention correctly stated."
        echo "            Watch out for spaces in filenames. You can either choose \" \ \" for spaces or put the filenames into doubble quotationmarks (see Example)."
        echo "            Files can not be named \"-h\"  "
        echo 
        echo " Option     Meaning"
        echo "   -h       Displays this help message"
        echo "   -a       Convert all *.mp4 files in the same folder as the script"
        echo
        echo " Example:   compress_with_ffmpeg \"nyan-cat_video.mp4\" \"other_random_video.mp4\" "
        echo
        echo "ffmpeg cmd: ffmpeg -i \"\$FILENAME\" -vcodec libx265 -crf 28 compressed_\"\$FILENAME\""
        echo 
        ;;
    "-a")
        echo
        echo "Converting all *.mp4 files in current folder"
        FILELIST='ls *.mp4'
        for FILENAME in $FILELIST ; do
            echo 
            echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
            echo "                                                      Start to compress $FILENAME"
            echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
            echo 
            ffmpeg -i "$FILENAME" -map 0 -vcodec libx265 -crf 28 compressed_"$FILENAME"
            NUM=$($NUM + 1)
        done
        ;;
    *)
        for FILENAME in "$@"; do
            echo 
            echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
            echo "                                                      Start to compress $FILENAME"
            echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
            echo 
            ffmpeg -i "$FILENAME" -map 0 -vcodec libx265 -crf 28 compressed_"$FILENAME"
            NUM=$($NUM + 1)
        done
        if [ "$NUM" = '0' ]; then
            echo
            echo "No arguments, please use -h for help."
        else 
            echo
            echo "Done! Converted $NUM files."
        fi
        ;;
esac
}

# Run script
requirement_check ffmpeg
main "$@"

#read -p "Press any key to continue... " -n 1 -s
exit 0
