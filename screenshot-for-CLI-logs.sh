#!/bin/bash

echo "🔧 Starting log cleanup and screenshot generation..."

# Function to escape XML characters for pango
escape_xml() {
    sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
}

# Function to add Metasploit-style colorization to log text
colorize_log() {
    local input="$1"
    local output="$2"

    # Escape XML and apply basic color coding
    cat "$input" | escape_xml \
    | sed -e 's/\[!\]/<span foreground="yellow">[!]<\/span>/g' \
          -e 's/\[\*\]/<span foreground="blue">[*]<\/span>/g' \
          -e 's/\[-\]/<span foreground="red">[-]<\/span>/g' \
          -e 's/\[+\]/<span foreground="green">[+]<\/span>/g' \
          > "$output"
}

# Process each log
find . -type f -path "*/logs/*.log" | while read -r logfile; do
    echo "🧹 Processing: $logfile"

    # Paths and filenames
    module_folder=$(dirname "$(dirname "$logfile")")
    screenshots_folder="$module_folder/screenshots"
    ip_name=$(basename "$logfile" .log)
    cleaned_log="/tmp/${ip_name}_cleaned.log"
    colorized_log="/tmp/${ip_name}_pango.txt"
    output_image="${screenshots_folder}/${ip_name}.png"

    # Strip ANSI codes
    sed -r "s/\x1B\[[0-9;]*[mGK]//g" "$logfile" > "$cleaned_log"

    # Apply color formatting
    colorize_log "$cleaned_log" "$colorized_log"

    # Create output folder
    mkdir -p "$screenshots_folder"

    # Generate styled screenshot
    convert -background black -fill white -font Monospace -pointsize 18 \
        pango:@"$colorized_log" "$output_image"

    echo "✅ Screenshot saved: $output_image"
done

