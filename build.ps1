# force connections to use TLS 1.2 (needed for community site Invoke 
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

param(
    [alias("t")]
    [string]$tasks = ''
)

function DownloadSetup {
    $source = "https://raw.github.com/openAgile/psake-tools/master/setup.ps1"  
    Invoke-WebRequest -Uri $source  -UseBasicParsing -OutFile setup.ps1
}

try {
    DownloadSetup
    .\setup.ps1 $tasks
}
Catch {
    Write-Host $_.Exception.Message
    exit 1
}
