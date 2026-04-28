# About
### A bash script for aircrack-ng that uses some aircrack-ng commands like: airmon-ng, airodump-ng, and aireplay-ng. This script also uses macchanger for security. 
# Usage
### 1. Clone the repository:
```bash
git clone https://github.com/random-pythonuser/Utils-for-aircrack-ng.git
cd $(pwd)/Utils-for-aircrack-ng
```
### 2. Make the script executable:
```bash
chmod +x ./util_aircrack.sh
```
### 3. Use the script:
```bash
./util_aircrack.sh init (interface)
./util_aircrack.sh mac (interface)
./util_aircrack.sh monitor (interface)
./util_aircrack.sh clean (interface)
```
### Flags meaning:
- init -> changes mac and initializes monitor mode
- mac -> changes mac 
- monitor -> initiates monitor mode and executes the airodump monitor
- clean -> stops monitor mode in the interface and restarts networkmanager
# Warning
### Only use the attacks for networks you own or you have authorization to.
# Credits and Creator message
### This Github repository was made by a 12 year old and its my first repository!
### Hope you like it!
### Youtube -> https://www.youtube.com/@quatabyte 
