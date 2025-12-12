# Purpose: Verify IPv4 traceroute path to a well-known host.

Create R alias:

  $ alias R="${CRAM_REMOTE_COMMAND:-}"

Traceroute to 1.1.1.1 limiting to 5 hops for brevity:
  $ R "traceroute -m 5 -q 1 1.1.1.1 2>/dev/null | sed 's/[[:space:]]\\+/ /g' || echo traceroute-failed"
  * (glob)
