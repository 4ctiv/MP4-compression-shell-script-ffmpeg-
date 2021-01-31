# MP4-compression-shell-script-ffmpeg-
Small shell script to compress multiple (mp4) files using ffmpeg.

Input:  Video files (readable by ffmpeg) [$FILENAME]
Output: Video files as x265 \*.mp4 [compressed_$FILENAME]

Used ffmpeg command:  ffmpeg -i \"\$FILENAME\" -vcodec libx265 -crf 28 comressed_\"\$FILENAME\"

Usage: sh Compress_with_ffmpeg.sh [Option] [ARGS...]

Options:
  ----------------------------------------
  -  Option    Meaning                   -
  -    -h      Display help dialogue     -
  ________________________________________

ARGS... :
  ----------------------------------------
  Full Filename of to converting video. (Has to be in the same folder as the shell script)
    e.g.: "nyan-cat_video.mp4"


Dependencies:
  ffmpeg 4.2.4 (tested version)
