⚙️ TCP Behavior in Tor — What Happens to Connections in Multi-Hop Routing
1. Why TCP Is Tricky in Tor

TCP was designed for stable, low-latency, direct connections.

Tor circuits are:

multi-hop

high latency

encrypted

unpredictable

sensitive to jitter

affected by Internet routing changes outside Tor

This means TCP behaves differently inside Tor tunnels.

2. The Three Things That Break TCP in Tor
1️⃣ Latency

Each hop adds delay.
TCP sees slow ACKs → slows down → reduces throughput.

2️⃣ Jitter

Variable latency confuses TCP’s congestion control.

TCP assumes:

jitter = congestion

congestion = back off the sending rate

Even when nothing is wrong.

3️⃣ Packet Loss

A tiny bit of loss over Tor feels like:

huge lag

stalled pages

dropped downloads

endless “Connecting…”

Because TCP retransmissions multiply across hops.

3. The TCP Timeline Inside Tor

When a browser downloads a file through Tor:

Tor creates a circuit (3 hops).

Browser sends a TCP SYN.

Tor wraps it in 3 layers of encryption.

It passes through guard → middle → exit.

Exit sends SYN to website.

Website replies → goes back through the 3 hops.

ACKs return slowly and inconsistently.

TCP interprets this as congestion.

TCP slows way down to avoid packet loss.

Your download speed drops dramatically.

This is normal behavior.

4. What Causes Slow Tor Speeds (Engineering Explanation)

Long-distance circuits

ISP congestion

bad routing to guard or exit

BGP route changes

overloaded relays

jitter on intermediate links

TCP congestion back-off

retransmission storms

queue delays on busy relays

Knowing this lets you diagnose Tor performance scientifically.

5. What You Will Learn Hands-On Later

You will eventually run tests like:

1️⃣ ss -t state established

To see how many active TCP connections your relay is handling.

2️⃣ Using tcpdump

To see retransmissions and congestion signals.

3️⃣ Throughput graphs

To watch how TCP rate changes under jitter.

4️⃣ File download test over Tor

To observe TCP slow-start and stalls.

These will give you real-world TCP analytics skills.

6. Why This Matters for Your Tor Relay Project

Understanding TCP in Tor helps you:

interpret weird download behavior

spot routing-induced slowdowns

understand why low jitter = fast Tor

tune your ISP or router for stability

explain performance like a real network engineer

build a portfolio-level understanding of Tor transport behavior

This file is the foundation for your TCP Stability Lab later.