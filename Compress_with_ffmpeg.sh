NUM=0
// echo \$1 is $1 
if [ $1 = "-h" ]
then
    echo "Help for compress_with_ffmpeg.sh"
    echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
    echo " Usage:     sh compress_with_ffmpeg [Option] [ARGS...]"
    echo " "
    echo " Option     Meaning"
    echo "   -h       Displays this help message"
    echo " "
    echo " Example:   compress_with_ffmpeg \"nyan-cat_video.mp4\" \"other_random_video.mp4\" "
    echo " "
    echo "ffmpeg cmd: ffmpeg -i \"\$FILENAME\" -vcodec libx265 -crf 28 compressed_\"\$FILENAME\""
    echo " "
    echo " ARGS:      Arguments: Names of the to converting files."
    echo "            The files have to be in the same folder, as the script and need to have the filename + file-extention correctly stated."
    echo "            Watch out for spaces in filenames. You can either choose \" \ \" for spaces or put the filenames into doubble quotationmarks (see Example)."
    echo "            Files can not be named \"-h\"  "
else
    for FILENAME in "$@"; do
        echo " "
        echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
        echo "                                                      Start to compress $FILENAME"
        echo "-----------------------------------------------------------------------------------------------------------------------------------------------------"
        echo " "
        ffmpeg -i "$FILENAME" -map 0 -vcodec libx265 -crf 28 compressed_"$FILENAME"
        NUM=$(($NUM + 1))
    done
fi

if [ $1 = "-h" ]
then
    echo
elif [ $NUM = '0' ]; then
    echo " "
    echo "No arguments, please use -h for help."
else
    echo " "
    echo "Done! Converted $NUM files."
fi
