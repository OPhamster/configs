#!/usr/bin/env bash

# Read JSON data that Claude Code sends to stdin
input=$(cat)

# Extract fields using jq
MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
# The "// 0" provides a fallback if the field is null
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
SESSION_ID=$(echo "$input" | jq -r '.session_id')
SESSION_COST=$(echo "$input" | jq -r '.cost.total_cost_usd')

# Output the status line - ${DIR##*/} extracts just the folder name
echo "[SESSION-$SESSION_ID] 📁 ${DIR##*/} | ${PCT}% context | SESSION_COST: ${SESSION_COST}"
