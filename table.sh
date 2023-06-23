#!/bin/bash

# Set the directory path
directory="run1"

# Define the output CSV file
output_file="systems.csv"

# Remove the output file if it already exists
if [ -f "$output_file" ]; then
  rm "$output_file"
fi

echo "system,total particles" > "$output_file"

# Iterate over the files in the directory that match the pattern
for file in "$directory"/*_start.gro; do
  # Get the filename without the "_start.gro" suffix
  filename=$(basename "$file" "_start.gro")
  
  # Get the second line of the file
  second_line=$(sed -n '2p' "$file")
  
  # Append the data to the CSV file
  echo "$filename,$second_line" >> "$output_file"
done

echo "CSV file '$output_file' has been created."

