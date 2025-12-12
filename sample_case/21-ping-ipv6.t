# Purpose: Verify basic IPv6 ping connectivity to a well-known host if IPv6 is available.

Create R alias:

  $ alias R="${CRAM_REMOTE_COMMAND:-}"

Ping 2606:4700:4700::1111 (Cloudflare) 3 packets with 1s deadline (non-fatal if not configured):
  $ R "ping6 -c 3 -W 1 2606:4700:4700::1111 || echo ping6-failed"
  * (glob)
