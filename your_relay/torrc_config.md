⚙️ torrc Configuration — Middle Relay Settings

This file documents the Tor relay configuration used by the node, including parameter explanations and safe defaults.

1. torrc File Location

Primary config file:

/etc/tor/torrc


System defaults (do not edit):

/usr/share/tor/tor-service-defaults-torrc

2. Current torrc Configuration (Middle Relay)
# Tor Middle Relay Configuration

ORPort 9001
Nickname CacheMeOutside
ContactInfo (your email here)

ExitRelay 0

Log notice file /var/log/tor/notices.log
RunAsDaemon 1
User debian-tor

# Relay Bandwidth Settings
RelayBandwidthRate 5 MB
RelayBandwidthBurst 10 MB

# Metrics
AvoidDiskWrites 1

3. Explanation of Each Section
ORPort

The port your relay uses to communicate with other Tor nodes.
Default for relays = 9001.

Nickname

Your public relay name as shown in Tor Metrics.

ContactInfo

Optional but recommended.
Visible in Tor network status documents.

ExitRelay 0

For middle relay only.
Ensures no exit traffic leaves your node (safer, lower risk).

RelayBandwidthRate & Burst

Controls how much bandwidth you let Tor use.

Rate = sustained limit

Burst = temporary spikes allowed

Log notice

Stores Tor logs in /var/log/tor/notices.log.

AvoidDiskWrites 1

Reduces disk wear and avoids unnecessary writes.

4. Notes About Middle Relays

Middle relays:

carry encrypted traffic

do not handle DNS

do not see IP addresses

are safe and low-risk

stabilize circuits across the network

Your config reflects best practices for a middle relay.

5. Verification Steps

After modifying torrc, always run:

sudo systemctl restart tor@default
sudo systemctl status tor@default


Then check:

sudo journalctl -u tor@default -f


Look for:

no syntax errors

no permission issues

“Bootstrapped 100%”