#!/bin/sh -l

# input_path=$1
# output_path=$2

echo "Input path: $INPUT_PATH"
echo "Output path: $OUTPUT_PATH"

mkdir -p $OUTPUT_PATH

Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

for file in $(find $input_path -name '*.drawio'); do
  drawio --export --format png --output "$output_path/$(basename $file .drawio).png" $file
done

echo "Rendering complete."
