Routing Stability Analysis for Tor Relays
Why It Matters

Tor relays depend on stable Internet paths. If the route between your machine and other relays changes, slows, or becomes congested, Tor circuits rebuild and user performance drops.
This file teaches you how to observe routing behavior like a network engineer using traceroute, mtr, and ping.

🔧 Tools You Will Use

traceroute — see hop-by-hop paths

mtr — real-time route + loss + jitter

ping — baseline latency

whois — identify ASNs

geoiplookup — geographic hop approximation

🧪 Baseline Routing Tests
1️⃣ Test: Path to Cloudflare (1.1.1.1)
mtr -rw -c 100 1.1.1.1 > mtr_cloudflare.txt

2️⃣ Test: Path to Google (8.8.8.8)
mtr -rw -c 100 8.8.8.8 > mtr_google.txt

3️⃣ Test: Path to Your Guard Node
cat /var/lib/tor/state | grep EntryGuard
mtr -rw -c 100 <GUARD_IP> > mtr_guard.txt

🧩 How to Analyze Stability
Stable Path Indicators

Latency steady ±5 ms

Same hop count

Same ASNs

No packet loss

Unstable Path Indicators

Latency spikes

Hop count changes

Packet loss 5–20%

ASN changes (possible BGP shift)

📊 Exercises

Run:

mtr -rw 1.1.1.1


Watch for path changes, jitter, or packet loss.

🎓 What You Learned
This file teaches how to visualize the Internet path from your relay, detect congestion, and understand routing stability — core skills for Tor relay engineering.