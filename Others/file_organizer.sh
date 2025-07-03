#!/bin/bash

# File Organizer Script by Sathya ✨
# Organizes files into folders based on file type with logging and colors

# ====== Color codes ======
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

# ====== Setup ======
TARGET_DIR="$PWD"   # Set target directory (default: current)
LOGFILE="$TARGET_DIR/file_organizer.log"
DATE=$(date)

# ====== Logging start ======
echo "[$DATE] Organizing files in: $TARGET_DIR" >> "$LOGFILE"
echo -e "${YELLOW}Starting file organization in $TARGET_DIR...${RESET}"

# ====== Create folders if they don't exist ======
mkdir -p "$TARGET_DIR/Documents" "$TARGET_DIR/Images" "$TARGET_DIR/Music" "$TARGET_DIR/Videos" "$TARGET_DIR/Others"

# ====== Loop through files ======
for FILE in "$TARGET_DIR"/*; do
    if [ -f "$FILE" ]; then
        EXT="${FILE##*.}"
        BASENAME=$(basename "$FILE")

        case "$EXT" in
            pdf|doc|docx|txt)
                mv "$FILE" "$TARGET_DIR/Documents/"
                echo "$BASENAME -> Documents" >> "$LOGFILE"
                echo -e "${GREEN}[✓] $BASENAME moved to Documents${RESET}"
                ;;
            jpg|jpeg|png|gif)
                mv "$FILE" "$TARGET_DIR/Images/"
                echo "$BASENAME -> Images" >> "$LOGFILE"
                echo -e "${GREEN}[✓] $BASENAME moved to Images${RESET}"
                ;;
            mp3|wav)
                mv "$FILE" "$TARGET_DIR/Music/"
                echo "$BASENAME -> Music" >> "$LOGFILE"
                echo -e "${GREEN}[✓] $BASENAME moved to Music${RESET}"
                ;;
            mp4|mkv|mov)
                mv "$FILE" "$TARGET_DIR/Videos/"
                echo "$BASENAME -> Videos" >> "$LOGFILE"
                echo -e "${GREEN}[✓] $BASENAME moved to Videos${RESET}"
                ;;
            *)
                mv "$FILE" "$TARGET_DIR/Others/"
                echo "$BASENAME -> Others" >> "$LOGFILE"
                echo -e "${GREEN}[✓] $BASENAME moved to Others${RESET}"
                ;;
        esac
    fi
done

# ====== Done ======
echo -e "${YELLOW}File organization complete. Log saved to $LOGFILE.${RESET}"
