# Privacy Policy — RTX Audio Visualizer

## The short version

The visualizer listens to your system's audio output to draw pictures.
**Nothing leaves your machine.** There is no telemetry, no account, no
network requirement.

## What the app accesses

| Data | Where it goes |
|------|---------------|
| System audio (WASAPI loopback) | Analyzed in-process for visuals. Never recorded to disk, never transmitted. |
| Log files | `%LOCALAPPDATA%\RTXAudioVisualizer\logs\` — local only, you can delete them freely. |

## Optional local AI

If you enable it (`O` key), the app can query an **Ollama server running
on your own machine** (`localhost:11434`) to critique and adjust visuals.
This is off by default and talks only to localhost. If you point Ollama
at a remote host, that choice and its privacy implications are yours.

## Third-party services

None, by default. The packaged build makes no outbound connections.
