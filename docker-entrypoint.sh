#!/bin/sh

# Save credentials if provided
if [ -n "$API_ID" ] && [ -n "$API_HASH" ] && [ -n "$PHONE_NUMBER" ]; then
  echo "Running with provided API credentials..."
  python main.py --api-id "$API_ID" --api-hash "$API_HASH" --phone "$PHONE_NUMBER"
else
  echo "No full credentials provided. Starting interactive mode..."
  python main.py
fi
