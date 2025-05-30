#!/bin/bash

# Install the required Python module

# Function to run the bot and restart if it crashes
run_bot() {
    echo "Starting Telegram bot..."
    while true; do
        # Run the bot in the background
        python3 stx.py
        
        # If the bot exits, wait for 5 seconds before restarting
        echo "Bot stopped. Restarting in 5 seconds..."
        sleep 3
    done
}

# Run the bot with nohup to keep it running even if the terminal is closed
nohup bash -c "run_bot" > bot_log.txt 2>&1 &

echo "Bot started in background with automatic restart. Check bot_log.txt for logs."
echo "Process ID: $!"

#!/bin/bash
pip3 install telegram

# Set the path to your Python script
PYTHON_SCRIPT="stx.py"

while true; do
  # Run the Python script
  nohup python3 "$PYTHON_SCRIPT" > /dev/null 2>&1 &

  # Check the exit status of the script
  exit_code=$?

  # If the script exited with a non-zero status (error), restart it
  if [ $exit_code -ne 0 ]; then
    echo "Python script exited with code $exit_code. Restarting..."
    sleep 5 # Wait for 5 seconds before restarting (optional)
  else
    echo "Python script exited normally."
    break # Exit the loop if the script completes successfully
  fi
done
