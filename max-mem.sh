# Set systemd hard limit
systemd-run --user --scope -p MemoryMax=<memorylimit> \
  -p MemorySwapMax=<swaplimit> <command>

# CPU Quota half
systemd-run --user --scope -p CPUQuota=50% -p MemoryMax=<memorylimit> \
  -p MemorySwapMax=<swaplimit> <command>
