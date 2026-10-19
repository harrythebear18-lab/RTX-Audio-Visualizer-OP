# RTX Audio Visualizer v1.1.0 — Sentinal

**Artifact:** `RTX-Audio-Visualizer-v1.1.0-sentinal.zip`
**Zip SHA-256:** `94d6778b844cf190d393f360ae5cc93b20b2df8fe1b7b2ee11fbdc05895457c3`
**Seal:** `02be902b3a9f4cfd850bad1628298e52ff36bbd8edd4f49666d5590ccc448b65`

Self-contained Windows x64. Extract anywhere, run `DXRenderer.exe`.
.NET runtime included. Verify contents with `VERIFY.ps1` against
`MANIFEST.sha256` (183 files, both shipped inside the package).

## What's new

- **84 modes** — 79 built-in + 4 managed custom seeds + runtime-registered
  user modes. All built-ins verified to compile; stale-blob silent
  failures eliminated.
- **Patch Bay (F8)** — declarative custom-mode authoring: JSON
  definitions → validated against a bounded expression grammar → HLSL
  codegen → live runtime registration, no restart. Duplicate/delete
  seeds, archetype templates, F5 hot reload.
- **Perceptual layer** — Bark bands, masking horizon, roughness, onset
  surprise, chroma/key lock, chord tracking, streams and room response
  feed every mode.
- **Barriers fixed** — tracked resource state replaces `_firstFrame`
  inference (Skia overlay, generative graph feedback, spectrum upload).
  Zero D3D12 debug-layer errors over a 50s soak.
- **Real DX11 fallback** — `RTX_FORCE_DX11=1`: 83/84 pixel modes,
  honestly degraded (no compute/postfx/feedback). `generative` is a
  declared placeholder by design.
- **Shader-compile audit** — `fbm`/vector-init/`dsp_cb`-include and a
  `water_droplets` OOB fix; embed vs runtime paths reconciled.
- **Package integrity** — dual-pass obfuscated assemblies, SHA-256
  manifest, verify script; ReadyToRun images, symbols stripped.

## Known limits

- `dx_bloom_downsample_sm50` fails FXC embed (register space needs sm_5_1);
  inert — DX11 never loads the bloom chain.
- Work-graph (`wg_audio_visualizer`) shader reports API-shape errors at
  embed time; the DX12U work-graph path is opt-in experimental.
- OpenXR needs the `openxr_loader` runtime (absent → clean message,
  desktop continues).

## Privacy

No telemetry, analytics, update checks, or crash reporters. Only network
endpoint: `localhost:11434` (Ollama), opt-in via `O`/`G`, off by default.
Audio never leaves the machine.
