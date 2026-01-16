#!/usr/bin/env bash
docker-compose up --build -d

echo "Waiting for frontend to start..."
sleep 8

FRONTEND_URL="http://localhost:5173"

OS="$(uname | tr '[:upper:]' '[:lower:]')"

echo "Opening frontend at $FRONTEND_URL"

if [[ "$OS" == "darwin" ]]; then
    # macOS
    open "$FRONTEND_URL"
elif [[ "$OS" == "linux" ]]; then
    # Linux
    xdg-open "$FRONTEND_URL"
elif [[ "$OS" == "msys"* || "$OS" == "cygwin"* ]]; then
    # Windows Git Bash / Cygwin
    cmd.exe /c start "$FRONTEND_URL"
else
    echo "Please open your browser and go to $FRONTEND_URL"
fi
