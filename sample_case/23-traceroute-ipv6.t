# Purpose: Verify IPv6 traceroute path to a well-known host if IPv6 is available.

Create R alias:

  $ alias R="${CRAM_REMOTE_COMMAND:-}"

Traceroute6 to 2606:4700:4700::1111 limiting to 5 hops (non-fatal if not configured):
  $ R "traceroute6 -m 5 -q 1 2606:4700:4700::1111 2>/dev/null | sed 's/[[:space:]]\\+/ /g' || echo traceroute6-failed"
  * (glob)
