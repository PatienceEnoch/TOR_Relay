🔗 Session Affinity (Stickiness) — Why TCP Needs Stable Paths
1. What Is Session Affinity?

Session Affinity (also called stickiness) ensures that once a client connects to a server:

all future packets

all future requests

all future flows

go to the same server.

It prevents the connection from being spread across multiple backend servers.

2. Why TCP Requires Session Affinity

TCP isn’t like HTTP.
It’s a stateful protocol.

TCP requires:

the same source

the same destination

the same sequence numbers

the same state machine

If you suddenly change servers mid-connection:

the server doesn’t know the sequence numbers

the server doesn’t have the session state

TCP resets

downloads fail

browsers hang

This is why session affinity exists.

3. Why Anycast + TCP Is Hard

Anycast routing can flip your traffic:

morning: routed to Chicago

afternoon: routed to Dallas

evening: routed to Atlanta

If this happens while your TCP connection is open:

connection will break

downloads stall

websites freeze

Tor circuits fail

That's why Anycast deployments must enforce session affinity.

4. How Networks Enforce Session Affinity
🔸 Method 1 — Connection Pinning

CDNs pin your TCP connection to one backend server.

🔸 Method 2 — Backend Sticky Mapping

Load balancers keep a mapping:

Client_IP → Specific_Backend

🔸 Method 3 — Flow Hashing

Routers use:

source IP

destination IP

ports

protocol

to ensure packets follow the same path.

🔸 Method 4 — Layer 7 Cookies

For web traffic.

🔸 Method 5 — BGP Anycast Geometry

Traffic engineering to stabilize client paths.

5. How This Relates to Tor

Tor circuits rely on:

stable paths

stable hops

low jitter

low packet loss

If any hop changes because of routing:

TCP session collapses

Tor circuit stalls

onion service becomes unreachable

downloads break

consensus fetch fails

This is why Tor tries to:

keep circuits long-lived

avoid unnecessary path changes

maintain guard stability

Session affinity concepts directly explain why Tor hates unstable routing.

6. Summary
Topic	Without Affinity	With Affinity
TCP Downloads	Break	Stable
Anycast Routing	Can flip paths	Stable
Browser Performance	Freezes	Smooth
Tor Circuits	Drop	Stay alive

Understanding this lets you reason about:

routing instability

guard selection

jitter effects

circuit failures

exit behavior

This is big-league networking