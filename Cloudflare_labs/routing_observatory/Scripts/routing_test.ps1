# routing_test.ps1
# Collects traceroute + ping data and saves it with timestamps
# Part of Ashley Hopkins' Cloudflare Routing Observatory

# Generate timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Output file path
$outputFile = "..\data\raw\trace_$timestamp.txt"

# Targets to test
$targets = @(
    "1.1.1.1",    # Cloudflare
    "8.8.8.8",    # Google
    "151.101.1.69" # Fastly CDN
)

# Write header
"Routing Test - $timestamp" | Out-File $outputFile
"-------------------------------------------" | Out-File $outputFile -Append

foreach ($t in $targets) {
    ">>> TARGET: $t" | Out-File $outputFile -Append
    "" | Out-File $outputFile -Append

    # Traceroute
    "Traceroute:" | Out-File $outputFile -Append
    tracert $t | Out-File $outputFile -Append

    "" | Out-File $outputFile -Append

    # Ping test
    "Ping Test:" | Out-File $outputFile -Append
    ping -n 5 $t | Out-File $outputFile -Append

    "" | Out-File $outputFile -Append
    "-------------------------------------------" | Out-File $outputFile -Append
}