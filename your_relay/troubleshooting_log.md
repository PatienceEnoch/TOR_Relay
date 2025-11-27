🛠️ Tor Relay Troubleshooting Log

This file tracks issues, fixes, commands, and lessons learned while running the relay.

Keeping a clean troubleshooting record shows strong systems administration habits.

Issue 1 — Tor Would Not Start

Symptom:

systemctl status tor@default showed no output

No log entries being written

Fix:

sudo systemctl start tor@default


Verification:

sudo systemctl status tor@default
sudo journalctl -u tor@default -f

Issue 2 — Could Not Edit torrc

Symptom:
Permission denied when editing /etc/tor/torrc.

Fix:
Use sudo:

sudo nano /etc/tor/torrc

Issue 3 — Fingerprint Not Found

Symptom:
User ran cat /var/lib/tor/fingerprint and file appeared missing.

Fix:
Relay had not fully started. Running:

sudo systemctl start tor@default


caused Tor to generate keys and fingerprint.

Issue 4 — Relay Not Showing Up in Consensus

Reason:
It takes time (30–60 minutes) before new relays appear.

Check with:

sudo journalctl -u tor@default -f


Look for:

descriptor published

no ORPort errors

stable uptime

Notes to Self

Always restart Tor after editing torrc.

Always check journalctl for real-time logs.

Avoid deleting /var/lib/tor/keys/.

Stability matters more than bandwidth.