#!/bin/bash

display_disk_usage(){
    echo "Disk Utilization Report"
    echo "========================"
    echo

    # Use df to get disk usage
    disk_usage=$(df -h | awk 'NR==1 || /^\/dev\// {print $0}') 
    # The awk command prints the first line (the header) and any line that starts with /dev/, which represents the actual disk partitions.

    # Display the disk usage
    echo "$disk_usage"
    echo

    # Check if any disk utilization is more than 80%
    high_usage=false
    while IFS= read -r line; do
        usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
        if [[ "$usage" -gt 80 ]]; then
            high_usage=true
            break
        fi
    done <<< "$disk_usage"

    if $high_usage; then
        echo "Disk utilization is more than 80%, expand the disk or free up the space"
        
        # Send email notification
        subject="Disk Utilization Alert"
        body="Warning: Disk utilization is more than 80%. Please take necessary action."
        recipient="rajatdhage04@gmail.com"
        
        echo "$body" | mail -s "$subject" "$recipient"
    else
        echo "Enough Disk Space is available"
    fi
}

display_disk_usage
