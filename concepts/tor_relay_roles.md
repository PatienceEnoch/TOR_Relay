🛡️ Tor Relay Roles — Guard, Middle, Exit Explained
1. The Three Roles in a Tor Circuit

A Tor circuit always has exactly three relays:

Guard (Entry) Relay

First hop

Sees your IP

Must be stable, high-uptime, trustworthy

Middle Relay (You)

Second hop

Carries the bulk of the encrypted traffic

Sees no IP addresses

Ties the circuit together

Exit Relay

Last hop

Connects to the Internet

Sees destination sites

Handles DNS

Highest legal risk

Your node (as a middle relay) is the safest position to run.

2. How Tor Chooses Relays

Tor clients pick relays based on:

Bandwidth (measured by directory authorities)

Flags (Stable, Guard, Fast, Running)

Uptime

Family rules (no relay in same family)

Country distribution

Exit policy

Consensus weight

Your relay earns more circuits as it proves:

consistent uptime

stable routing path

predictable latency

no congestion

good bandwidth capacity

This is why we created files for routing, latency, jitter, TCP, DNS, and BGP.

They all affect your consensus weight indirectly.

3. Why the Middle Relay Role Matters

Middle relays:

carry the majority of Tor traffic

stabilize circuits

reduce load on guards

protect anonymity

improve global capacity

avoid exit risk

Middle relays keep Tor fast.

If middle relays disappear:

Tor becomes slow

circuits fail more often

guard and exit load increases

anonymity sets shrink

Your relay is doing important network-level work.

4. What Clients See (and Don’t See)
Guard sees:

your IP

but not your destination

Middle sees:

encrypted traffic only

no IPs

no DNS

no identities

Exit sees:

destination IP

but not who the user is

No single relay sees the whole picture.

5. How Relay Role Impacts Performance
Guards need:

rock-solid routing

low jitter

high uptime

Middles (you) need:

good throughput

stable upstream routing

low packet loss

consistent latency

Exits need:

strong DNS

high bandwidth

good transport stability

This explains why each concept in your folder matters.

6. Why This File Completes Your Concepts Folder

This file connects all the others:

routing stability

TCP behavior

latency & jitter

DNS dependencies

BGP risks

Everything you are learning supports your role as a middle relay, the backbone of Tor.