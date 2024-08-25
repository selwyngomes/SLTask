
# sellyscript.sh - System Resource Monitoring Script

sellyscript.sh is a simple Bash script designed to monitor various system resources on a Linux server. It provides a dashboard format for viewing system metrics such as CPU usage, memory usage, disk usage, network statistics, system load, and the status of essential services. Users can run the script to display the entire dashboard or specific sections using command-line switches.




## Features

- Top 10 Applications by CPU and Memory Usage: Shows the most resource-consuming applications.

- Network Monitoring: Displays the number of concurrent connections, packet drops, and network usage.

- Disk Usage: Displays disk space usage by mounted partitions and highlights partitions using more than 80% of space.

- System Load: Shows the current load average and breakdown of CPU usage.

- Memory Usage: Displays total, used, and free memory, including swap memory usage.

- Process Monitoring: Displays the number of active processes and the top 5 processes by CPU and memory usage.

- Service Monitoring: Monitors the status of essential services like sshd, nginx, apache2, and iptables.



## Deployment

1. Clone the Repository: If you haven't already, clone the repository to your local machine:

```bash
  git clone https://github.com/selwyngomes/sellyscript.sh.git
  cd your-repository  
```
2. Make the Script Executable: Before running the script, ensure it is executable by running:

```bash
  chmod +x sellyscript.sh
```

3. Run the Script: You can run the script without any arguments to display the full dashboard, or specify a command-line switch to display specific parts:

- Display all sections:
```bash
  ./sellyscript.sh -all
```
- Display top applications by CPU and memory usage:
```bash
  ./sellyscript.sh -cpu
```
- Display network monitoring:
```bash
  ./sellyscript.sh -network
```
- Display disk usage:
```bash
  ./sellyscript.sh -disk
```
- Display system load:
```bash
 ./sellyscript.sh -load
```
- Display memory usage:
```bash
  ./sellyscript.sh -memory
```
- Display process monitoring:
```bash
  ./sellyscript.sh -process
```
- Display service monitoring:
```bash
  ./sellyscript.sh -service
```









## Demo

```bash
Top 10 Applications by CPU Usage:
USER       PID        %CPU  %MEM  COMMAND
root       1234       30.0  1.5   /usr/bin/app1
selly      5678       15.0  2.0   /usr/bin/app2
...

Network Monitoring:
Concurrent connections: 10
Packet drops: 0
Network usage (in KB):
RX packets: 1000 errors:0 dropped:0 overruns:0 frame:0
TX packets: 800 errors:0 dropped:0 overruns:0 carrier:0
...
```
## Contributing

- Contributions are always welcome!

- If you have suggestions for improving the script, feel free to create a pull request or open an issue on GitHub.


## License

[MIT](https://choosealicense.com/licenses/mit/)
