#!/bin/bash

top_apps() {
  echo "Top 10 Applications by CPU Usage:"
  ps aux --sort=-%cpu | awk 'NR<=11{printf "%-10s %-10s %-5s %-5s %-5s\n", $1, $2, $3, $4, $11}'
  echo ""
  echo "Top 10 Applications by Memory Usage:"
  ps aux --sort=-%mem | awk 'NR<=11{printf "%-10s %-10s %-5s %-5s %-5s\n", $1, $2, $3, $4, $11}'
}

network_monitor() {
  echo "Network Monitoring:"
  echo "Concurrent connections: $(netstat -an | grep 'ESTABLISHED' | wc -l)"
  echo "Packet drops:"
  netstat -s | grep 'dropped'
  echo "Network usage (in KB):"
  ifconfig | grep -E "RX packets|TX packets"
}

disk_usage() {
  echo "Disk Usage:"
  df -h | awk '$5+0 >= 80 {print "Warning: High Usage -", $0}'
}

system_load() {
  echo "System Load:"
  echo "Load average: $(uptime | awk -F'load average: ' '{ print $2 }')"
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)" | awk '{print "User: " $2 " System: " $4 " Idle: " $8}'
}

memory_usage() {
  echo "Memory Usage:"
  free -h | awk 'NR==2{printf "Total: %s Used: %s Free: %s\n", $2, $3, $4}'
  free -h | awk 'NR==3{printf "Swap Total: %s Swap Used: %s Swap Free: %s\n", $2, $3, $4}'
}

process_monitor() {
  echo "Process Monitoring:"
  echo "Active processes: $(ps aux | wc -l)"
  echo "Top 5 Processes by CPU and Memory Usage:"
  ps aux --sort=-%cpu,-%mem | head -n 6 | awk '{printf "%-10s %-10s %-5s %-5s %-5s\n", $1, $2, $3, $4, $11}'
}

service_monitor() {
  echo "Service Monitoring:"
  for service in sshd nginx apache2 iptables; do
    if systemctl is-active --quiet $service; then
      echo "$service is running"
    else
      echo "$service is not running"
    fi
  done
}

if [[ $# -eq 0 ]]; then
  clear
  top_apps
  echo ""
  network_monitor
  echo ""
  disk_usage
  echo ""
  system_load
  echo ""
  memory_usage
  echo ""
  process_monitor
  echo ""
  service_monitor
else

  if [[ $1 == "-cpu" ]]; then
    top_apps
  elif [[ $1 == "-network" ]]; then
    network_monitor
  elif [[ $1 == "-disk" ]]; then
    disk_usage
  elif [[ $1 == "-load" ]]; then
    system_load
  elif [[ $1 == "-memory" ]]; then
    memory_usage
  elif [[ $1 == "-process" ]]; then
    process_monitor
  elif [[ $1 == "-service" ]]; then
    service_monitor
  elif [[ $1 == "-all" ]]; then
    clear
    top_apps
    echo ""
    network_monitor
    echo ""
    disk_usage
    echo ""
    system_load
    echo ""
    memory_usage
    echo ""
    process_monitor
    echo ""
    service_monitor
  else
    echo "Invalid option: $1"
    echo "Usage: $0 [-cpu | -network | -disk | -load | -memory | -process | -service | -all]"
  fi
fi
