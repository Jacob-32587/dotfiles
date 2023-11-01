winget install Microsoft.WindowsTerminal Microsoft.PowerToys vscodium
winget install -e --id Microsoft.VisualStudio.2022.BuildTools --override "--passive --wait --add Microsoft.VisualStudio.Workload.VCTools;includeRecommended"
./settings.ps1  