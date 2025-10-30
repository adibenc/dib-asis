# ==============================================================================
# FUNCTION: cut_video_crop_resize
# DESCRIPTION:
#   Cuts a video clip by time, crops it spatially, and optionally scales 
#   (resizes) the resulting clip.
#
# ARGUMENTS:
#   $1 - Input file path (e.g., "input.mp4")
#   $2 - Start time (e.g., "00:00:05" or "5.0")
#   $3 - End time (e.g., "00:00:15" or "15.0")
#   $4 - Crop parameters (Format: W:H:X:Y, e.g., "800:600:200:100")
#   $5 - (Optional) Scale parameters (Format: W:H, e.g., "400:300" or "640:-1")
#   $6 - Output file path (e.g., "output.mp4")
#
# USAGE EXAMPLE:
#   # Cut from 5s to 15s, crop 800x600 starting at (200,100), then scale to 400x300
#   cut_video_crop_resize "input.mp4" "5" "15" "800:600:200:100" "400:300" "final_clip.mp4"
#
#   # Cut from 0s to 10s, crop center 1920x1080, no additional scaling
#   # Note the -1 for the optional scale parameter when only cropping is needed.
#   CENTER_CROP="1920:1080:(in_w-1920)/2:(in_h-1080)/2"
#   cut_video_crop_resize "hd_video.mp4" "0" "10" "$CENTER_CROP" "-1" "10sec_center_crop.mp4"
# ==============================================================================
: '
# ob 1
cut_video_crop_resize "2025-10-30 10-40-12.mkv" "5" "15" "487:582:60:120" "" "c-2025-10-30 10-40-12.mkv.mp4"

# scaling relative to obs x vmbox
cut_video_crop_resize "2025-10-30 10-40-12.mkv" "5" "15" "370:438:60:120" "" "c-2025-10-30 10-40-12.mkv.mp4"
cut_video_crop_resize "2025-10-30 10-40-12.mkv" "5" "15" "487:582:130:100" "" "c-2025-10-30 10-40-12.mkv.mp4"
'
cut_video_crop_resize() {
    local input_file="$1"
    local start_time="$2"
    local end_time="$3"
    local crop_params="$4"
    local scale_params="$5"
    local output_file="$6"
    
    # Check for required arguments
    if [ "$#" -lt 6 ]; then
        echo "Error: Missing required arguments."
        echo "Usage: cut_video_crop_resize <input> <start_time> <end_time> <crop_W:H:X:Y> <scale_W:H | -1> <output>"
        return 1
    fi
    
    local filters="crop=${crop_params}"
    
    # Append scale filter if scale parameters are provided and not '-1'
    if [ -n "$scale_params" ] && [ "$scale_params" != "-1" ]; then
        filters="${filters},scale=${scale_params}"
    fi
    
    echo "--- Starting FFmpeg Process ---"
    echo "Input: $input_file"
    echo "Time Range: $start_time to $end_time"
    echo "Video Filters: $filters"
    echo "Output: $output_file"
    echo "-------------------------------"

    # The main ffmpeg command
    ffmpeg -ss "${start_time}" \
           -i "${input_file}" \
           -to "${end_time}" \
           -vf "${filters}" \
           -c:v libx264 \
           -crf 23 \
           -preset veryfast \
           -c:a aac \
           -b:a 128k \
           -y "${output_file}"
           
    if [ $? -eq 0 ]; then
        echo "Success: Video saved to ${output_file}"
    else
        echo "Error: FFmpeg failed to process the video."
        return 1
    fi
}

# cut_bidoff "2025-10-30 10-40-12.mkv"
cut_bidoff(){
	cut_video_crop_resize "$1" "0" "60" "370:438:60:120" "" "c-b1-$1.mp4"
	cut_video_crop_resize "$1" "0" "60" "370:438:430:120" "" "c-b2-$1.mp4"
	cut_video_crop_resize "$1" "0" "60" "370:438:800:120" "" "c-b3-$1.mp4"
	cut_video_crop_resize "$1" "0" "60" "370:438:1170:120" "" "c-b4-$1.mp4"
}
