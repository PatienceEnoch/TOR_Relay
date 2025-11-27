💥 How TCP Breaks — The Mechanics of Collapse Under Real Network Conditions
1. Why TCP Breaks

TCP is designed to be:

ordered

reliable

congestion-aware

However, on real networks — especially multi-hop systems like Tor — several conditions cause TCP to “give up,” slow to a crawl, or reset entirely.

2. The 5 Conditions That Break TCP
1️⃣ Latency

High round-trip time slows:

SYN/SYN-ACK handshake

ACK return rate

congestion window growth

TCP interprets long delays as congestion → reduces speed → stalls.

2️⃣ Jitter

Inconsistent latency confuses TCP’s pacing algorithm.

Effects:

spiky throughput

frequent back-off

collapse of congestion window

slow-start repeating over and over

3️⃣ Packet Loss

Even 1% loss can cut throughput by ~50%.

Because:

each lost packet triggers retransmissions

retransmissions pile up

congestion window shrinks

flows stall

Loss + latency is deadly.

4️⃣ Path Instability

If routing changes mid-connection:

packets arrive out of order

sequence numbers get mismatched

new path has new latency/jitter

TCP fails to adapt

session resets after repeated duplicate ACKs

Tor is especially sensitive to this because paths span many ISPs.

5️⃣ Bufferbloat

Routers with oversized queues cause:

very long latency

high jitter

“lag spikes”

delayed ACKs

TCP thinks the network is dying and backs off sharply.

3. What TCP Collapse Looks Like

Symptoms:

downloads hang

“Connecting…” for 10+ seconds

pages freeze half-loaded

sudden slowdowns

streaming breaks

Tor circuits rebuild

Indicators:

repeated slow-start cycles

congestion window stuck small

retransmission spikes

high RTT variation

4. How This Applies to Tor

Tor circuits contain 3 TCP connections:

Client → Guard

Guard → Middle (you)

Middle → Exit

If ANY of these links have:

jitter

loss

congestion

routing changes

bufferbloat

Then the entire circuit slows down.

Tor hides IPs but cannot hide physics.
TCP follows the worst-performing hop.

5. How to Observe TCP Breaking (You Will Do This Later)

You will eventually run:

1️⃣ ss -t state established

Shows all active TCP flows your relay participates in.

2️⃣ tcpdump

To capture:

retransmissions

out-of-order packets

duplicate ACKs

RTO (retransmission timeout) events

3️⃣ Wireshark

To see:

slow-start

congestion window collapse

RTT spikes

TCP resets

handshake failures

This is advanced but powerful.

6. Summary

TCP breaks when:

latency is high

jitter is unstable

packet loss occurs

routing paths shift

queues are bloated

In Tor:

one bad hop = entire circuit slows

every TCP weakness is magnified

global routing instability causes slow browsing

Understanding this makes you a stronger Tor relay engineer — and a stronger network engineer overall.