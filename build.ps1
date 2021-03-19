param(
    [alias("t")]
    [string]$tasks = ''
)

function DownloadSetup {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
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
