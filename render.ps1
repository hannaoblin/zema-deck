# Rend src/deck.html en PDF (Zema-presentation.pdf) et en aperçu (preview/all.png).
$here = $PSScriptRoot
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$url = "file:///" + ($here -replace '\\', '/') + "/src/deck.html"
$common = @("--headless=new", "--disable-gpu", "--user-data-dir=$env:TEMP\edgedeck", "--virtual-time-budget=8000")

Start-Process -FilePath $edge -Wait -ArgumentList ($common + @("--no-pdf-header-footer", "`"--print-to-pdf=$here\Zema-presentation.pdf`"", "`"$url`""))
New-Item -ItemType Directory -Force "$here\preview" | Out-Null
Start-Process -FilePath $edge -Wait -ArgumentList ($common + @("--hide-scrollbars", "--window-size=1920,8640", "`"--screenshot=$here\preview\all.png`"", "`"$url`""))
