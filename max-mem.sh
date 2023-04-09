# Set systemd hard limit
systemd-run --user --scope -p MemoryMax=<memorylimit> \
  -p MemorySwapMax=<swaplimit> <command>
