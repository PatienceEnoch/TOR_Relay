🌍 Network Path Study — Tor Relay Routing Analysis

This study analyzes the routing paths between:

your relay

guard nodes

exit nodes

major DNS resolvers

global Internet endpoints

It evaluates:

path length

hop stability

jitter

packet loss

routing changes

congestion points

1. Tools Used

mtr

traceroute

ping

whois

geoiplookup

You will fill this file with real data after running tests.

2. Baseline Paths to Major Hosts
Cloudflare (1.1.1.1)

To be filled with:

hop list

ASNs

latency

jitter

anomalies

Google (8.8.8.8)

To be filled with:

path stability

routing changes

packet loss

3. Paths to Tor Relays
Guard Node
mtr <GUARD_IP>


Record:

number of hops

stable/unstable behavior

jitter

congested hops

Exit Relay
mtr <EXIT_IP>


Record:

path consistency

long RTT spikes

BGP hints (ASN changes)

4. Observations & Findings

Document:

repeated route changes

congestion in specific ASNs

geographic detours

hop instability

increased jitter

packet loss on transit networks

5. Interpretation & Theory

Explain what your findings indicate:

upstream congestion

BGP oscillation

exit relay overload

DNS latency issues

unstable guard routing

VM → Wi-Fi issues

This connects directly to your concepts folder.

6. Next Tests to Run

Examples:

compare paths at different times of day

run long-duration MTR tests (100 cycles)

test multiple guards

test multiple exits

traceroute via TCP (tcptraceroute)

Over time, this becomes a professional traffic engineering notebook.