🌐 DNS Dependencies in Tor — Why DNS Still Matters
1. Does Tor Use DNS?

For onion addresses → NO.
For normal websites → YES (but only at the exit node).

Tor itself does not do DNS lookups on your machine.

However…

exit relays must resolve domain names

clients rely on exits for DNS

DNS latency affects circuit performance

DNS failures break connections

DNS hijacks affect exit traffic

DNS is still part of the Tor ecosystem.

2. How DNS Works in Tor
When accessing a normal website:

Your Tor Browser sends a request through a 3-hop circuit.

The exit relay receives the request.

The exit relay performs a DNS lookup:

using its own resolvers

often via ISP or public DNS

Exit connects to the destination IP.

Traffic returns through the circuit.

The important part:

🟦 Your IP never touches DNS queries.
🔵 Only the exit node interacts with DNS.
🟣 But slow DNS slows down Tor for everyone.

3. DNS Bottlenecks That Impact Tor
1️⃣ Slow DNS resolvers at exits

long delays

pages take longer to start loading

sometimes “Connecting…” for 10 seconds

2️⃣ DNS outages

Exit nodes cannot resolve domains →
Tor appears broken.

3️⃣ DNS hijacking

Some ISPs rewrite DNS traffic (yes, even today).

If an exit is on a bad or hostile ISP:

wrong IP returned

broken pages

connection resets

failed TLS connections

4️⃣ High DNS latency

Each lookup may add:

100ms

300ms

or even 1+ seconds

Multiply this by:

multiple assets

multiple connections

multiple domains per page

Tor browsing becomes painfully slow.

4. Why DNS Affects Tor Performance

DNS is part of the circuit bootstrap.

If DNS is slow:

circuit is slow

webpages delay before loading

TCP handshake is delayed

pipeline stalls

perceived performance drops

Even though Tor hides your IP, DNS timing still matters.

5. How To Measure DNS Impact with Hands-On Tools

Later in the analysis labs, you’ll run:

1️⃣ Query DNS through Tor exits
dig @<exit_IP> google.com


Observe:

query time

resolver used

consistency

2️⃣ Compare multiple exits

If one exit is slow → exit problem
If many exits are slow → global DNS issue

3️⃣ Measure DNS latency outside Tor
dig google.com
dig cloudflare.com


You’ll learn:

baseline DNS speed

comparing resolvers

how DNS affects circuit bootstrap time

6. Why This Matters for Your Tor Project

Understanding DNS dependencies helps you:

diagnose “Tor is slow but routing looks fine”

recognize exit-related DNS bottlenecks

explain DNS behavior in your GitHub project

build a complete Tor performance picture

learn skills used by CDN engineers and SREs

This is a key component of real Tor relay engineering.