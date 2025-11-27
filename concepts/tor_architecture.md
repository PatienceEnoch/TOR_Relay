🧩 Tor Architecture — How Your Relay Fits in the Network
1. What Tor Actually Is

Tor is a multi-hop, onion-routed network designed to remove metadata (who is talking to who).
A Tor circuit always has:

Guard Relay (entry)

Middle Relay (you!)

Exit Relay

Destination (website, service, etc.)

Your node is the middle hop — the stability backbone.

2. How a Tor Circuit Is Built

A Tor client builds circuits like this:

Pick a guard (long-term, stable)

Pick a middle (short-term, random — you)

Pick an exit

Wrap traffic in multiple encryption layers (“onion”)

Send it through the three hops

Each hop only knows:

the previous hop

the next hop

No one sees the whole path.

3. Why Middle Relays Matter

Middle relays like your node:

carry the majority of Tor traffic

stabilize circuits

reduce load on exits

help protect anonymity

improve network capacity

Middle relays also see no IP addresses, so they are safer to run.

4. How Tor Handles Routing Internally

Tor does NOT use BGP or Anycast.

Instead, Tor:

maintains a consensus document

every relay publishes descriptors

clients pick relays based on:

bandwidth

flags (Stable, Guard, Fast)

uptime

family restrictions

country

load balancing rules

Traffic is load-balanced across thousands of relays.

5. Why Routing Stability Matters

Tor circuits break or rebuild when:

your ISP’s path to a guard changes

the guard’s ISP changes

congestion hits mid-path

routes oscillate between upstreams

This is why you are learning:

routing stability

TCP stability

latency analysis

jitter analysis

path monitoring

congestion detection

Because Tor performance is directly tied to Internet routing behavior outside Tor.

6. What You Will Learn (Hands-On)

This module prepares you to analyze:

how your relay participates in circuits

how path changes affect Tor

how latency impacts guard→middle→exit

how to measure congestion

how to troubleshoot slow circuits

how TCP behaves across multi-hop networks

This is global network engineering applied to Tor.