📈 Tor Relay Performance Metrics

This file tracks performance characteristics of the relay, including bandwidth, stability, latency, and Tor consensus activity.

1. Bandwidth Observations
RelayBandwidthRate / Burst

Configured:

Rate: 5 MB/s
Burst: 10 MB/s

Observed Throughput

(You will fill these in as you monitor your relay.)

Examples to track:

sustained bandwidth

traffic spikes

hourly/daily averages

2. Uptime Tracking

Record uptime from:

systemctl status tor@default


And:

uptime


Example format:

Date	Uptime	Notes
2025-11-27	2h 14m	Initial startup successful
(add more here)		
3. Bootstrapping Times

Track how long Tor takes to reach:

Bootstrapped 100%


Useful for noticing:

routing instability

DNS delays at exits

relay congestion

path changes

Example:

Date	Time to Bootstrap	Notes
2025-11-27	~45 seconds	Normal
4. Routing Stability Notes

Reference your routing_stability.md file.

Use:

mtr -rw 1.1.1.1
mtr -rw <GUARD_IP>


Record:

jitter

hop changes

packet loss

strange behavior

Example:

2025-11-27:
- path to guard changed 2 times
- jitter increased from 5ms → 22ms
- possible upstream congestion

5. Latency Benchmarks

Using ping:

ping -c 20 1.1.1.1


Record:

min

avg

max

jitter

Example:

Avg latency: 32.4 ms
Jitter: ~4 ms

6. Consensus Weight Tracking

You can check your weight here (later):

https://metrics.torproject.org/rs.html

Track when your relay:

gets flags (Running, Fast, Stable)

increases in weight

gets used more

Example:

Consensus Weight: pending (new relay)

7. Notes & Patterns

Add anything noteworthy:

dips in performance

time of day patterns

routing events

congestion

long bootstrap

sudden fast/slow behavior

relay identity warnings

This will become part of your full Tor engineering portfolio.