<p align="center">
  <img src="5da3b451-06cc-422e-8e51-7f2913a310f5.png" alt="Tor Relay Project Banner" width="100%">
</p>

# Tor Middle Relay Engineering

This repository grew out of operating a non-exit Tor middle relay and using it as a reason to dig deeper into Linux services, TCP behavior, routing, latency, DNS dependencies, and how a distributed network behaves outside a classroom diagram.

The relay itself is only one part of the repo. I also kept the troubleshooting notes, research, concepts, and network-analysis work that came out of running it.

## What I worked with

- Linux service administration
- Tor relay configuration
- TCP/IP and port reachability
- Logging and troubleshooting
- Latency and jitter
- DNS dependencies
- Routing behavior and internet-path analysis
- Privacy-aware infrastructure

## Repository map

| Area | Purpose |
| --- | --- |
| `cachemeoutside_relay/` and `my_relay/` | relay-specific configuration and notes |
| `Troubleshooting/` | failures, observations, and fixes |
| `analysis/` | network and performance analysis |
| `concepts/` | networking concepts connected to the relay |
| `research/` | supporting research and deeper dives |
| `Cloudflare_labs/` | related networking experiments |

## Why I keep this project

This was one of the projects that moved networking from something I studied into something I could observe.

Running a real network service forced me to think about questions such as:

- Is the service running, or is it actually reachable?
- Is a slow connection a host problem, a path problem, or normal internet variation?
- What can logs prove?
- What changes when traffic crosses systems I do not control?
- How much can I infer from the edge of a distributed network?

Those questions now show up again in my newer work on BGP failover and network observability.

## Where my work went next

- [Mini Internet](https://github.com/PatienceEnoch/mini-internet): controlled BGP failover and convergence experiments
- [Network Flight Recorder](https://github.com/PatienceEnoch/network-flight-recorder): local-first observability, incident evidence, diagnosis, and guarded recovery
- [Cloud Network Architecture Journal](https://github.com/PatienceEnoch/Cloud_Network_Architecture_Journal): routing and architecture notes

This repository is a documented project/lab record; it should not be read as a claim that the relay is continuously online today.
