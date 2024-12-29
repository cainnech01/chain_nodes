#!/bin/bash

# Function to print text with gradient color
print_gradient() {
    # Split input into lines
    IFS=$'\n' read -r -d '' -a lines <<< "$1"
    
    # Calculate total number of lines
    total_lines=${#lines[@]}
    
    # Define gradient range (cyan colors in 256-color mode)
    start_color=51  # bright cyan
    end_color=37   # darker cyan
    
    # Print each line with its corresponding color
    for ((i = 0; i < total_lines; i++)); do
        # Calculate current color in the gradient
        progress=$(echo "scale=4; $i / ($total_lines - 1)" | bc)
        color_diff=$(echo "scale=4; $start_color - $end_color" | bc)
        current_color=$(echo "scale=0; $start_color - ($color_diff * $progress)" | bc)
        
        # Print the line with calculated color
        echo -e "\033[38;5;${current_color}m${lines[$i]}\033[0m"
    done
}

read -r -d '' ASCII_ART << 'EOT'
__/\\\\\\________/\\\\\\\\\________________________________________/\\\\\\\\\\___/\\\\\\_        
 _\/\\\//______/\\\////////_______________________________________/\\\///////\\\_\////\\\_       
  _\/\\\______/\\\/___________________________/\\\________________\///______/\\\_____\/\\\_      
   _\/\\\_____/\\\______________/\\\\\\\\\____\///___/\\/\\\\\\___________/\\\//______\/\\\_     
    _\/\\\____\/\\\_____________\////////\\\____/\\\_\/\\\////\\\_________\////\\\_____\/\\\_    
     _\/\\\____\//\\\______________/\\\\\\\\\\__\/\\\_\/\\\__\//\\\___________\//\\\____\/\\\_   
      _\/\\\_____\///\\\___________/\\\/////\\\__\/\\\_\/\\\___\/\\\__/\\\______/\\\_____\/\\\_  
       _\/\\\\\\____\////\\\\\\\\\_\//\\\\\\\\/\\_\/\\\_\/\\\___\/\\\_\///\\\\\\\\\/____/\\\\\\_ 
        _\//////________\/////////___\////////\//__\///__\///____\///____\/////////_____\//////__
EOT

print_gradient "$ASCII_ART"
