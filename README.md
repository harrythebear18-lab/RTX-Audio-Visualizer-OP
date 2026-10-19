# RTX Audio Visualizer (DX12 Ultimate)

A real-time GPU audio visualizer for Windows — 84 visualization modes
rendered in HLSL on a DX12 Ultimate renderer, driven by a WASAPI loopback
capture pipeline with psychoacoustic analysis (Bark bands, masking,
roughness) and a custom-mode authoring surface called Patch Bay.

A Sentinal Systems UK product.

This repository is the **public home**: downloads, documentation, issue
tracking. Development happens in a private repository; releases are
published here.

## Download

Grab the latest build from
[**Releases**](https://github.com/harrythebear18-lab/RTX-Audio-Visualizer-OP/releases).

| File | What it is |
|------|------------|
| `RTX-Audio-Visualizer-v1.1.0-sentinal.zip` | Self-contained Windows x64 package — extract anywhere, run `DXRenderer.exe`. .NET runtime included. SHA-256 manifest inside; verify with `VERIFY.ps1`. |

**Requirements:** Windows 10/11, a DirectX 12 Ultimate-capable GPU
(NVIDIA RTX, AMD RDNA2+, Intel Arc), ~8 GB RAM, any audio output device
(the app captures system audio via loopback — nothing is uploaded).

## What it does

- **84 visualization modes** — spectrum analyzers, raymarched interiors,
  perceptual landscapes, room acoustics, psychoacoustic spatial fields,
  and four managed custom-mode seeds. Most are egocentric scenes: you
  are inside the sound.
- **Patch Bay (F8)** — built-in custom-mode authoring. Write a
  declarative JSON mode (objects, camera, audio bindings), hit Apply,
  and the mode validates, compiles and registers live — no restart. The
  grammar is machine-checkable: every expression is validated before
  codegen, which makes it safe for local AI tools to author modes too.
- **Perception-driven visuals** — the engine computes Bark-band energy,
  spectral masking, roughness, onset surprise, chroma/key, chord
  tracking, streams and room response. Modes render *what you hear*,
  not raw FFT bars.
- **Generative mode** — six persistent GPU compute graphs (dynamics,
  spectrum, spatial, rhythm, DSP character, section/mood) whose blend
  weights *are* the song's fingerprint. Different songs genuinely look
  different.
- **Real analysis, not just RMS** — 8-band spectrum, tempo/beat/kick
  detection, LUFS loudness, THD, crest factor, phase coherence, stereo
  field telemetry — all feeding shader uniforms every frame.
- **Honest fallbacks** — DX12U mainline, DX12 FL12_0 fallback, and a
  real D3D11 pixel-mode path (`RTX_FORCE_DX11=1`) that degrades
  honestly: 83/84 modes, no compute/postfx. Nothing pretends.
- **OpenXR VR** — stereo rendering, head tracking, comfort-tuned post
  pipeline. Desktop when no headset is present.
- **Live shader iteration** — edit a shader, press `F5`, the mode
  recompiles and swaps in. Compile failures keep the previous pipeline.

## Controls

| Key | Action |
|-----|--------|
| `M` / `N` | Next / previous visualization mode |
| `H` | Toggle brain HUD (shows live analysis) |
| `B` | Toggle director HUD |
| `A` | Auto mode selection (brain picks the mode) |
| `S` | Visual settings panel (color grade, post-FX) |
| `F8` | Patch Bay — custom-mode authoring surface |
| `F5` | Hot-reload the current mode's shader |
| `Y` | Toggle VSync |
| `D` | Cycle director: Auto / Observe / Off |
| `O` | Toggle Ollama vision feedback (optional, local) |
| `G` | Music AI / verbose logging |
| `ESC` | Quit |

## Privacy

No telemetry, no analytics, no update checks, no crash reporters. The
only network endpoint in the entire codebase is `localhost:11434` —
and only if you enable the optional Ollama features below. Audio never
leaves the machine; analysis happens entirely on your GPU.

## Optional: local AI feedback

If you run [Ollama](https://ollama.com) locally, the visualizer can
optionally use `qwen2.5vl` to watch its own output and `qwen2.5-coder`
to suggest adjustments — entirely local, off by default, toggled with
`O`. Patch Bay's declarative grammar also lets a local model author
modes safely: it writes typed JSON fields, never raw shader code, and
the runtime validates before anything compiles.
No connection is required; the app runs fully without it.

## License

Free for personal, educational, and commercial visualization use
(streaming, live performance, recording, broadcast). See
[SOFTWARE_POLICY.md](SOFTWARE_POLICY.md) and [LICENSE](LICENSE).
