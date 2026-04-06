# download-samples.ps1
# Downloads free CC0 sample GLB models for the Eye Candy AR demo.
# Run from the web/models/ directory:
#   cd web/models
#   .\download-samples.ps1

$ProgressPreference = 'SilentlyContinue'

$models = @(
    @{
        url  = "https://modelviewer.dev/shared-assets/models/Astronaut.glb"
        file = "demo-astronaut.glb"
        note = "Astronaut (Google model-viewer sample)"
    },
    @{
        url  = "https://modelviewer.dev/shared-assets/models/reflective-sphere.glb"
        file = "demo-sphere.glb"
        note = "Reflective sphere (Google model-viewer sample)"
    },
    @{
        url  = "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/Avocado/glTF-Binary/Avocado.glb"
        file = "demo-avocado.glb"
        note = "Avocado (Khronos glTF sample — good scale test)"
    }
)

foreach ($m in $models) {
    Write-Host "Downloading $($m.note)..."
    try {
        Invoke-WebRequest -Uri $m.url -OutFile $m.file -UseBasicParsing -TimeoutSec 30
        Write-Host "  OK: $($m.file) ($([math]::Round((Get-Item $m.file).Length / 1KB, 1)) KB)"
    } catch {
        Write-Host "  FAILED: $($_.Exception.Message)"
    }
}

Write-Host ""
Write-Host "Done. Rename any file to match your product ID (e.g. red-sweater.glb) to use it."
