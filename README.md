# RTX Audio Visualizer (DX12 Ultimate)

A real-time GPU audio visualizer for Windows — 55 visualization modes
rendered entirely in HLSL pixel shaders, driven by a WASAPI loopback
capture pipeline with psychoacoustic analysis and a generative engine
that grows a different visual identity per song.

A Visentrix product under Sentinal Systems.

This repository is the **public home**: downloads, documentation, issue
tracking. Development happens in a private repository; releases are
published here.

## Download

Grab the latest build from
[**Releases**](https://github.com/harrythebear18-lab/RTX-Audio-Visualizer-OP/releases).

| File | What it is |
|------|------------|
| `RTXAudioVisualizer_vX.Y.Z.zip` | Self-contained Windows x64 package — extract anywhere, run `DXRenderer.exe`. .NET runtime included. |

**Requirements:** Windows 10/11, a DirectX 12 Ultimate-capable GPU
(NVIDIA RTX, AMD RDNA2+, Intel Arc), ~8 GB RAM, any audio output device
(the app captures system audio via loopback — nothing is uploaded).

## What it does

- **55 visualization modes** — spectrum analyzers, raymarched fractals,
  ferrofluid pools, cymatic chambers, psychoacoustic spatial fields,
  VR-native audio environments.
- **Generative mode** — six persistent GPU compute graphs (dynamics,
  spectrum, spatial, rhythm, DSP character, section/mood) whose blend
  weights *are* the song's fingerprint. Different songs genuinely look
  different.
- **Real analysis, not just RMS** — 8-band spectrum, tempo/beat/kick
  detection, LUFS loudness, THD, crest factor, phase coherence, stereo
  field telemetry — all feeding shader uniforms every frame.
- **OpenXR VR** — stereo rendering, head tracking, comfort-tuned post
  pipeline. Desktop when no headset is present.
- **DX12 Ultimate features** — compute graphs, VRS, runtime-compiled
  ps_6_6/cs_6_6 shaders via DXC.

## Controls

| Key | Action |
|-----|--------|
| `M` / `N` | Next / previous visualization mode |
| `H` | Toggle brain HUD (shows live analysis) |
| `B` | Toggle director HUD |
| `A` | Auto mode selection (brain picks the mode) |
| `S` | Visual settings panel (color grade, post-FX) |
| `Y` | Toggle VSync |
| `D` | Cycle director: Auto / Observe / Off |
| `O` | Toggle Ollama vision feedback (optional, local) |
| `G` | Music AI / verbose logging |
| `ESC` | Quit |

## Optional: local AI feedback

If you run [Ollama](https://ollama.com) locally, the visualizer can
optionally use `qwen2.5vl` to watch its own output and `qwen2.5-coder`
to adjust shaders — entirely local, off by default, toggled with `O`.
No connection is required; the app runs fully without it.

## License

Free for personal, educational, and commercial visualization use
(streaming, live performance, recording, broadcast). See
[SOFTWARE_POLICY.md](SOFTWARE_POLICY.md) and [LICENSE](LICENSE).
