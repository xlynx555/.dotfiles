#!/usr/bin/env -S pwsh -NoProfile
# @vicinae.schemaVersion 1
# @vicinae.title GK Snippets
# @vicinae.mode silent
# @vicinae.argument1 { "type": "text", "placeholder": "command" }

param(
    [string]$Command
)

try {
    Import-Module Jysk-Snippets -ErrorAction Stop
}
catch {
    Write-Error "Failed to import module 'Jysk-Snippets': $($_.Exception.Message)"
    exit 1
}

$javaws8 = '/usr/lib/jvm/jre1.8.0_202/bin/javaws'
$javaws6 = '/usr/lib/jvm/jre1.6.0_45/bin/javaws'

# If first argument is 1 letter + 3 digits, execute a PowerShell command.
if ($Command -match '^[A-Za-z][0-9]{3}$') {
    if (Get-Command -Name Get-JyskAlias -ErrorAction SilentlyContinue) {
        $alias = Get-JyskAlias $Command
        # $resolvedCommand.GK
        $jnlpUrl = "http://$($alias.GK):8096/jnlp/boclient.jnlp"
        Start-Process $javaws6 -ArgumentList $jnlpUrl | Out-Null
        # if (-not [string]::IsNullOrWhiteSpace($resolvedCommand)) {
        #     Invoke-Expression $resolvedCommand
        # }
    }
    else {
        Write-Output 'Get-JyskAlias function not found. Please ensure the Jysk-Snippets module is imported correctly.'
    }
}

switch ($Command) {
    'sm' {
        & $javaws8 "$HOME/Documents/smclient.jnlp"
        Write-Output "Executed SM client JNLP"
    }
    'smtest' {
        & $javaws8 "$HOME/Documents/smclient_test.jnlp"
        Write-Output "Executed test SM client JNLP"
    }
    'lpp' {
        & $javaws8 'http://sm-01-prod.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'
        Write-Output "Executed OneLPP SM client JNLP"
    }
    'lpptest' {
        & $javaws8   'http://sm-01-test.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'
        Write-Output "Executed OneLPP test SM client JNLP"
    }
}
