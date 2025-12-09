# Cloudflare-Oriented Network Research Labs

These labs extend my Tor relay project by exploring real-world routing,
latency behavior, protocol performance, and edge-compute design.
They are part of my long-term goal of becoming a Cloudflare engineer... 
a role where I can work on global networking, distributed systems, and
performance optimization at Internet scale.

Cloudflare inspires me because of its mission to build a better Internet, its
deep engineering culture, and its commitment to security, reliability, and
innovation at the edge.  
This project serves as both a learning journey and a portfolio that reflects
the kind of work I hope to contribute to Cloudflare one day.

---

## 01 — Routing & Latency Observatory
Analyze how Internet paths behave over time using real traceroutes and pings
from my environment.  
Focus areas include:

- path stability vs churn
- latency changes over days/weeks
- route flaps and Internet “weather”
- overlay routing (Tor) vs Anycast CDNs
- how global networks actually shift in real time

Deliverables: traceroute datasets, notebooks, graphs, churn analysis,
visualizations, and a written engineering summary.

---

## 02 — QUIC vs TCP Under Internet Chaos
Experimental comparison of QUIC and TCP during:

- congestion  
- jitter  
- packet loss  
- route changes  
- high-latency conditions  

Focus areas:

- congestion control  
- retransmission behavior  
- recovery times  
- protocol efficiency on unstable paths  
- how Cloudflare’s adoption of QUIC improves user performance  

Deliverables: experiment scripts, performance logs, graphs, comparative
analysis, and a final protocol engineering report.

---

## 03 — Micro-Edge: A “Tiny Cloudflare”
Build a miniature Cloudflare-style edge architecture on my own VM:

- reverse proxy (TLS termination, caching rules, headers)
- serverless-style functions
- key-value storage simulation
- observability (latency logs, edge decisions, cache behavior)

Focus: understanding how real edge networks are structured and why Cloudflare
designed its platform the way it did.

Deliverables: configs, worker-style code, observability dashboards, and a
design document comparing this micro-edge to Cloudflare’s architecture.

---

## Purpose & Long-Term Vision

This project demonstrates my ability to:

- analyze live Internet behavior  
- understand routing, Anycast, and global network patterns  
- design modern distributed systems  
- break down protocol behavior (TCP, QUIC)  
- build edge-inspired architectures  
- produce clear engineering documentation and visualizations  

These labs represent my ongoing preparation for a future role at **Cloudflare** —
a place where I hope to contribute to the global Internet, learn from world-class
engineers, and build systems that scale across continents and failure domains.