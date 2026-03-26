#!/bin/bash
# chrome_cache_clean.sh - Safe Chrome cache cleanup
# Usage: ./chrome_cache_clean.sh
# Chrome must be CLOSED before running

CHROME_DIR="$HOME/.config/google-chrome/Default"

# Check Chrome is not running
if pgrep -x "chrome" > /dev/null || pgrep -x "google-chrome" > /dev/null; then
    echo "[ERROR] Chrome is still running. Close it first."
    exit 1
fi

echo "[INFO] Chrome not running. Starting cleanup..."
echo ""

clean_dir() {
    local path="$1"
    local label="$2"
    if [ -e "$path" ]; then
        local size
        size=$(du -sh "$path" 2>/dev/null | cut -f1)
        rm -rf "$path"
        echo "[DONE] $label — freed ~$size"
    else
        echo "[SKIP] $label — not found"
    fi
}

# --- Safe to clean ---
clean_dir "$CHROME_DIR/Service Worker/CacheStorage"   "Service Worker CacheStorage"
clean_dir "$CHROME_DIR/Service Worker/ScriptCache"    "Service Worker ScriptCache"
clean_dir "$CHROME_DIR/GPUCache"                      "GPUCache"
clean_dir "$CHROME_DIR/Cache"                         "Cache"
clean_dir "$CHROME_DIR/Code Cache"                    "Code Cache"
clean_dir "$CHROME_DIR/Favicons"                      "Favicons (file)"
clean_dir "$CHROME_DIR/Favicons-journal"              "Favicons-journal"

echo ""
echo "[DONE] Cleanup complete."
echo "[INFO] Current .config size: $(du -sh "$HOME/.config/google-chrome" 2>/dev/null | cut -f1)"

