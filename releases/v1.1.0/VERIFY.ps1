# VERIFY.ps1 â€” Sentinal Systems payload integrity check
$ErrorActionPreference = 'Stop'
$here = $PSScriptRoot
$expected = @{}
Get-Content "$here\MANIFEST.sha256" | Where-Object { $_ -notmatch '^\s*#' -and $_.Trim() } | ForEach-Object {
    $h, $p = $_ -split '\s{2,}', 2; $expected[$p.Trim()] = $h.Trim()
}
$bad = @()
foreach ($kv in $expected.GetEnumerator()) {
    $f = Join-Path $here ($kv.Key -replace '/', '\')
    if (-not (Test-Path $f)) { $bad += "MISSING $($kv.Key)"; continue }
    if ((Get-FileHash $f -Algorithm SHA256).Hash.ToLower() -ne $kv.Value) { $bad += "MODIFIED $($kv.Key)" }
}
if ($bad) { $bad | ForEach-Object { Write-Host "FAIL $_" -ForegroundColor Red }; exit 1 }
Write-Host "PASS - $($expected.Count) files verified against Sentinal manifest" -ForegroundColor Green
