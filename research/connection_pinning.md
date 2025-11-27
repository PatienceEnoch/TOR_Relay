🎯 Connection Pinning — Keeping TCP Stable When Routing Shifts
1. What Is Connection Pinning?

Connection Pinning is a technique used by Anycast networks (Cloudflare, Google, Fastly, etc.) to ensure:

Once a TCP connection is established, it stays tied to the same physical server — even if routing changes around it.

This prevents broken sessions.

2. Why Pinning Is Necessary

TCP requires:

precise sequence numbers

ordered packets

stateful session tracking

If the Anycast path flips mid-connection:

your packets start hitting a different server

the new server has no session state

sequence numbers don’t match

TCP resets

downloads fail or hang

Pinning prevents this by locking your flow to a backend.

3. How Anycast Creates Instability

Anycast routing changes can happen because:

BGP path updates

ISP congestion

interconnection failures

IX (Internet Exchange) policy changes

multi-path routing

sudden traffic spikes

When this happens:

your traffic might be rerouted to a different Anycast server

but your TCP session cannot move with it

so the connection would die

Connection pinning is the fix.

4. How Networks Implement Connection Pinning
🔸 Method 1 — Source-IP Hashing

Routers map:

Client_IP + Ports → Same Backend

🔸 Method 2 — Session Tables

Load balancers store:

Client flows → Server ID

🔸 Method 3 — Connection Tickets

CDNs issue internal tickets for each client flow.

🔸 Method 4 — BGP Stability Shaping

The Anycast network attempts to maintain consistent routing for the lifetime of the connection.

🔸 Method 5 — ECMP Flow Locking

Routers lock specific flows to one path.

5. Why Connection Pinning Matters for Tor

Although Tor itself does not use Anycast for relay routing, it interacts with Anycast environments:

Websites behind Cloudflare

DNS queries made by exit relays

DDoS-protected services

CDN-distributed destinations

If Anycast path changes mid-circuit:

exit → website path can break

circuits stall

bootstrap can hang

onion service requests fail

downloads crawl or reset

So connection pinning is critical for stable Tor performance.

6. Connection Pinning vs Session Affinity (Simple Table)
Feature	Session Affinity	Connection Pinning
Purpose	Keep a session tied to a server	Keep TCP tied during routing shifts
Used By	Load balancers	CDNs, Anycast networks
Prevents	Backend confusion	TCP resets
Applies To	HTTP, application traffic	TCP-level flows
7. Summary

Connection Pinning ensures that:

Anycast stays stable

TCP stays alive

long-lived flows don’t break

routing changes don’t kill downloads

This teaches you how global routing affects Tor indirectly.