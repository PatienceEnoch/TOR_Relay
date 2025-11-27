⏱️ Latency & Jitter in Tor — What They Are and Why They Matter
1. Latency (Delay)

Latency is the time it takes a packet to travel from your machine to a destination.

Tor circuits add latency because traffic must pass through:

Guard

Middle (you)

Exit

Destination

And back again

Every hop adds delay.

Healthy latency for Tor:

< 80 ms local

< 200–300 ms typical circuits

400 ms = slow

800 ms = trouble

2. Jitter (Inconsistent Delay)

Jitter is variation in latency from packet to packet.

Example:

One packet: 60 ms

Next packet: 140 ms

Next packet: 75 ms

This is jitter.

Why jitter hurts Tor:

Tor uses TCP inside tunnels

TCP sees jitter as congestion

TCP slows down

Circuits stall

Downloads crawl

Jitter is one of the main causes of “Tor feels slow.”

3. What Causes Latency & Jitter
Latency causes:

Long geographic distance

Slow relays

High queueing delay

Weak ISP routing

Busy exits

Jitter causes:

Congested ISP links

BGP route changes

Bufferbloat

Bad Wi-Fi

Overloaded Tor nodes

Intermittent packet loss

4. How to Measure Latency

Use ping:

ping -c 20 1.1.1.1


Look for:

avg delay

min/max

packet loss

Use mtr:

mtr -rw 1.1.1.1


Look for:

per-hop delay

stability

high jitter at any hop

5. How to Measure Jitter

Use ping jitter mode (if available):

ping -D 1.1.1.1


Or calculate manually:

jitter = max latency – min latency (in a short window)

Use mtr, which shows jitter per hop:

“StDev” column = jitter

6. How Latency & Jitter Affect Tor Circuits
When latency is high:

pages load slowly

circuits rebuild

downloads stall

When jitter is high:

TCP thinks the network is congested

sending rate drops

throughput collapses

multi-hop circuits fail more often

When both are high:

Tor feels broken

connections time out

onion services become unreachable

7. What You Will Do in the Lab Later

You’ll run:

ping tests to multiple Tor relays

mtr tests to detect jitter

comparison graphs

circuit latency mapping

jitter-induced throughput measurements

This builds real-world traffic engineering skills.

8. Why This Matters in Your Tor Project

This file prepares you for:

routing stability testing

congestion analysis

guard/middle/exit path diagnosis

TCP stability labs

bandwidth behavior labs

end-to-end Tor performance analysis

You are learning the metrics that matter most in global routing.