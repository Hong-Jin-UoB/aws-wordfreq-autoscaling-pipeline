# Representative workload data

The recorded load test used 120 text files built from ten distinct source payloads. This directory keeps five financial-news payloads and the application's small test fixture as representative inputs, without storing repeated copies.

The WordFreq worker treats every file as text and counts token frequency regardless of the source schema. [`dataset-manifest.csv`](dataset-manifest.csv) records the role, file size and SHA-256 of every included payload.

The performance figures in this repository come from the recorded 120-file AWS experiment, not from a smaller local rerun.
