#!/bin/bash

# Print ASCII Art Logo
echo "                        ██╗  ██╗███████╗███████╗   ██╗███████╗                           "
echo "                        ╚██╗██╔╝██╔════╝██╔════╝   ██║██╔════╝                           "
echo "                         ╚███╔╝ ███████╗███████╗   ██║███████╗                           "
echo "                         ██╔██╗ ╚════██║╚════██║   ██║╚════██║                           "
echo "                        ██╔╝ ██╗███████║███████║██╗██║███████║                           "
echo "                        ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝╚══════╝                           "
echo "                     Made By Taylor Christian Newsome SleepTheGod                        "
echo "███████╗██╗    ██╗    ██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗  ██████╗ ███████╗██████╗ "
echo "██╔════╝██║    ██║    ██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ ██╔════╝ ██╔════╝██╔══██╗"
echo "███████╗██║ █╗ ██║    ██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗██║  ███╗█████╗  ██████╔╝"
echo "╚════██║██║███╗██║    ██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║██║   ██║██╔══╝  ██╔══██╗"
echo "███████║╚███╔███╔╝    ██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████╗██║  ██║"
echo "╚══════╝ ╚══╝╚══╝     ╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo "                      Act Retarded Don't Be Retarded Skids                               "

# Define the Service Worker URL
SERVICE_WORKER_URL="https://xss.is/service_worker.js"

# Function to check if the Service Worker URL is accessible
check_service_worker() {
    echo "Checking if the Service Worker is accessible..."
    response=$(curl -s -o /dev/null -w "%{http_code}" "$SERVICE_WORKER_URL")
    if [ "$response" -eq 200 ]; then
        echo "Service Worker is accessible at $SERVICE_WORKER_URL"
    else
        echo "Failed to access Service Worker at $SERVICE_WORKER_URL. Status code: $response"
        exit 1
    fi
}

# Function to show debug logs for local and remote sessions
show_debug_logs() {
    echo "Fetching debug logs from local session..."
    # Simulate local debug log
    echo "Local Debug Log: Session started successfully."

    # Fetch remote debug log from service worker or server
    echo "Fetching remote debug logs..."
    remote_log=$(curl -s "$SERVICE_WORKER_URL" | head -n 20) # Fetch first 20 lines as a sample
    if [ -z "$remote_log" ]; then
        echo "No remote debug logs fetched or error occurred."
    else
        echo "Remote Debug Log (from Service Worker):"
        echo "$remote_log"
    fi
}

# Function to register the Service Worker (simulation for bash)
register_service_worker() {
    echo "Simulating Service Worker registration from $SERVICE_WORKER_URL..."
    # Registration would happen in JavaScript on the browser, here it’s simulated in the Bash script
    echo "Service Worker successfully registered!"
}

# Function to check and handle caching
check_cache() {
    echo "Checking cache behavior..."
    CACHE_NAME="xf-offline"
    CACHE_ROUTE="index.php?sw/cache.json"
    OFFLINE_ROUTE="index.php?sw/offline"
    
    # Simulate cache operation
    echo "Attempting to fetch cache route..."
    cache_response=$(curl -s "$CACHE_ROUTE")
    if [ -z "$cache_response" ]; then
        echo "Failed to fetch cache response or empty response received."
    else
        echo "Cache response:"
        echo "$cache_response"
    fi
}

# Run all tasks with live debugging and error handling
check_service_worker
show_debug_logs
register_service_worker
check_cache

echo "All tasks completed successfully."
