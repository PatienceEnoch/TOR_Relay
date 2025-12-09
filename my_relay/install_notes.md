📥 Tor Relay Installation Notes

These notes document how the relay was installed, configured, and verified.
This file provides a reproducible record of the build process.

1. System Preparation
OS Used

Kali Linux (VM)

Initial Commands Run
sudo apt update
sudo apt upgrade -y

2. Install Tor
Install Tor + Dependencies
sudo apt install tor -y

Verify Install
tor --version

3. Tor Service Management
Start Tor
sudo systemctl start tor@default

Enable Autostart
sudo systemctl enable tor@default

Check Status
sudo systemctl status tor@default

4. Relay Files + Identity
View Relay Fingerprint
sudo cat /var/lib/tor/fingerprint


Record fingerprint here:

CacheMeOutside 6C107E82F0BA26F2BEB3F5745BEC7F033ABDCA94

Tor Keys Location

/var/lib/tor/keys/

/var/lib/tor/fingerprint

/var/lib/tor/hostname (for onion services, not used here)

5. torrc Configuration Location

Primary config file:

/etc/tor/torrc


Examples included in system documentation:

/usr/share/tor/tor-service-defaults-torrc

6. Networking Notes

Interface used: wlo1

VM connected through NAT / Wi-Fi

Relay runs as a middle relay for safe, low-risk participation

No exit policy enabled

7. Validation
Check if relay starts without errors
sudo journalctl -u tor@default -f

Monitor logs during startup

Look for:

"Bootstrapped 100%"

no warnings about ports

no permission errors

8. Next Steps

You will add:

torrc_config.md

troubleshooting_log.md

performance_metrics.md

fingerprints.txt

bandwidth_stats screenshots