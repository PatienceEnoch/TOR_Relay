📡 Anycast vs Unicast — Routing Models & Their Impact on Tor
1. What Is Unicast?

Unicast = one IP → one server
Traditional Internet routing.

Example:

8.8.8.8  →  one specific Google server


Features:

predictable

stable

latency depends on distance

always the same destination

Most Tor relay-to-relay traffic is unicast.

2. What Is Anycast?

Anycast = one IP → multiple servers around the world
And BGP sends you to the closest one (in theory).

Example: Cloudflare’s DNS

1.1.1.1  →  many servers in many countries


Features:

low latency

resilient

unpredictable routing

can change paths suddenly

depends on ISP → CDN relationships

Anycast is used by:

Cloudflare

Google DNS

Akamai

Fastly

CDNs

DDoS mitigation networks

3. How Anycast Works (Simple View)

Many servers share the same IP.

ISPs advertise paths to those servers via BGP.

You get routed to the “nearest” node.

If the network changes, BGP may reroute you automatically.

4. Why Anycast Causes Stability Problems

Anycast can cause:

path flips

sudden latency spikes

unpredictable routing

TCP resets

jitter

connection instability

Because BGP can change paths underneath ongoing TCP connections.

This is why:

🟣 CDNs rely on connection pinning
🟢 Load balancers use session affinity
🔵 Tor users can see sudden slowdowns

5. Why Unicast Is More Stable

Unicast sends you to:

the same server

the same route

the same path

same network conditions

This predictability makes TCP happier and more stable.

6. How This Affects Tor

Tor traffic is:

routed globally

sensitive to latency

sensitive to DDoS mitigation paths

sensitive to BGP changes

dependent on relay-to-relay stability

When any of the following use Anycast:

DNS resolvers

exit destinations

guard node supporting services

network security layers

You may see:

sudden slow circuits

long delays

bootstrap failures

circuit rebuilds

TCP collapsing due to jitter

This is why you are studying session affinity and connection pinning next.

7. Summary
Feature	Unicast	Anycast
Path Stability	⭐ High	⚠️ Medium
Latency	⚠️ Variable	⭐ Low (usually)
Jitter	Low	Higher
TCP Stability	Strong	Sometimes weak
Used By Tor?	Yes	Sometimes indirectly
Used By CDNs?	Rarely	Very heavily

Anycast is powerful, but unpredictable.
Understanding this makes you a better Tor relay engineer and a better network engineer overall.