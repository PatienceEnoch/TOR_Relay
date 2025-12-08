# DNS Troubleshooting Case Study: “Temporary failure resolving 'http.kali.org'”

**Author:** Ashley Hopkins  
**Project:** Tor Relay Project (`CacheMeOutside`)  
**System:** Kali Linux VM (VirtualBox, NAT mode)  
**Date:** *(fill in)*  

---

## 1. Problem Summary

While running:

```bash
sudo apt update

Kali returned:

Temporary failure resolving 'http.kali.org'


This indicates a DNS resolution failure — Kali could not convert the domain name into an IP address.

2. First Test: Can the VM reach the internet?
ping -c 3 8.8.8.8


Result:

Destination Host Unreachable

0 packets received

This showed no connectivity, not just DNS failure.

3. IP Check: 169.254.x.x = No DHCP Lease
ip a


Before fixing, Kali showed:

inet 169.254.x.x


A 169.254.x.x address means:

Kali did not get an IP from DHCP

VirtualBox networking wasn’t providing an address

With no IP:

No gateway

No route

No DNS

This is the real root cause.

4. Root Cause: VM in Wrong State + Bridged Confusion

Two major contributors:

1. The VM had been “Powered Off”

This can corrupt virtual network state.

2. The VM was not functioning correctly in bridged mode

Bridged mode can fail if:

The router blocks unknown MACs

DHCP pool is full

VM boots too fast

Router doesn’t respond

This caused the fallback to 169.254.x.x.

5. Fix: Switch to NAT + Restart Networking
5.1 VirtualBox Settings

Use:

Attached to: NAT

Adapter Type: Intel PRO/1000 MT Desktop

Cable connected: Yes

NAT is ideal for Tor relays because:

It always gives a stable IP (10.0.2.x)

No home router changes needed

Safe + simple

Works even if LAN has DHCP issues

5.2 Restart network service
sudo systemctl restart NetworkManager
ip a


Kali now had:

inet 10.0.2.15/24


A valid DHCP address from VirtualBox.

6. Verification
Connectivity Test
ping -c 3 8.8.8.8


✔️ Success
0% packet loss

DNS Test
ping -c 3 google.com


✔️ DNS resolved google.com to a real IP
✔️ Full success

7. Lessons Learned (Gold Nuggets)
💡 Gold Nugget #1

DNS errors often happen because the network is down, not because DNS is broken.

💡 Gold Nugget #2

169.254.x.x = No DHCP lease.
Instant clue the VM didn’t get an IP.

💡 Gold Nugget #3

Always Shutdown, never “Power Off.”
Prevents corrupted virtual network drivers.

💡 Gold Nugget #4

NAT is the correct mode for Tor relay operation.

8. Final State

After the fix, the system had:

Valid IPv4: 10.0.2.15

Internet connectivity

DNS resolution

Update capability restored

System ready for Tor relay startup

This case study documents a real-world networking issue directly relevant to maintaining a stable Tor relay environment.