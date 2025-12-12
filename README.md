
├── run_cram_test.sh	==> start case 
├── README.md
├── output/    			==> Test report
├── sample_case/		==> Test case
├── sample_cram/		==> Cram script(docker run import)
└── testbed/			==> Testbed (host pc first run need build image)

0.build dock image (First)
  "
  cd ./testbed/
  docker build -t prplos-testbed .
  "

1. load test fw to DUT

2. enable ssh

3. Confirm host PC get ip from DUT

4. Crate test case
  "
  cd ../sample_case/
  ls
  "

5. Folder for specified test
  "
  cd ../sample_cram/
  vi cram.sh
  run_check python3 -m cram --verbose ./sample_case/ | tee --append ./output/report_sample.txt
  "

  Note:
    - Additional sample .t tests previously under ATS_CI-2629/sample_case/ have been moved into this repository at:
        cram_sample-2629/sample_case/
    - Run them the same way as other sample_case tests. Example:
        run_check python3 -m cram --verbose ./sample_case/14-firewall-basic-rules.t | tee --append ./output/report_sample.txt

6. Execute docker_script.sh
  "
  cd ../
  sudo sh ./run_cram_test.sh
  "

8. Additional OpenWrt-QCA CRAM tests
  "
  New tests are added under sample_case/:
    - 10-wireless-bringup.t          : Wireless bring-up/down and status verification (iw/uci/ubus)
    - 11-lan-vlan-config.t           : VLAN 802.1q sub-interface creation and verification
    - 12-wan-ip-connectivity.t       : WAN IPv4/IPv6 connectivity pings with stable normalization
    - 13-lan-dhcp-lease.t            : DHCP server lease presence on LAN
    - 14-firewall-basic-rules.t      : Firewall ruleset presence (nft or iptables)
    - 15-throughput-sanity-ping.t    : Ping-based latency/packet loss sanity
    - 16-uci-set-commit-reload.t     : UCI set/commit/reload cycles for wireless/network
    - 17-log-ubus-events.t           : Log/ubus event presence after config changes

  Each test follows the sample_case format:
    - Create alias R=\"${CRAM_REMOTE_COMMAND:-}\" at top
    - Use R \"<command>\" to run on the DUT
    - Normalize volatile fields (timestamps, MACs, counters) using sed/grep/sort and glob/regex expectations

  To run:
    - Edit sample_cram/cram.sh if you want to run only a subset:
        run_check python3 -m cram --verbose ./sample_case/12-wan-ip-connectivity.t | tee --append ./output/report_sample.txt
    - Or run all tests (default in cram.sh) which executes the entire sample_case folder.

  Integration with ATS_CI flow:
    - The ./sample_case directory is the test root mounted into the robot container per this repository’s run_cram_test.sh.
    - The ATS_CI/README mentions ATS_CI_FLOW; use the same mounting when integrating with ATS flows.
  "

7. Confirm test result
  "
  cat output/report_sample.txt
  "