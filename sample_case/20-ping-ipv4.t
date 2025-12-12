# Purpose: Verify basic IPv4 ping connectivity to a well-known host or gateway.

Create R alias:

  $ alias R="${CRAM_REMOTE_COMMAND:-}"

Ping 1.1.1.1 (Cloudflare) 3 packets with 1s deadline:
  $ R "ping -c 3 -W 1 1.1.1.1 || echo ping-failed"
  * (glob)
