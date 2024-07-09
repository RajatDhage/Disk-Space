# Disk Utilization Monitoring and Alert System

## Overview
Developed a Bash script to monitor disk utilization and provide real-time alerts when usage exceeds a specified threshold. This script is designed to be run on Unix-based systems and integrates with the system's email service to notify administrators of potential disk space issues.

## Key Features

- **Real-time Disk Utilization Monitoring:**
  - Utilizes the `df` command to gather disk usage statistics for all mounted filesystems.

- **Threshold Alert System:**
  - Checks if any filesystem's usage exceeds 80% and triggers an alert.

- **Email Notifications:**
  - Sends an email notification to a specified recipient if disk utilization surpasses the threshold, ensuring timely intervention to prevent system failures.
