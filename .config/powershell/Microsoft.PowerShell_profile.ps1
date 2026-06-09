$env:PATH += ":/home/dle/.krew/bin:/home/dle/.local/bin:/home/dle/.cargo/bin"
Invoke-Expression (&starship init powershell)

Set-Variable -Name "JYSKPSRepoKey" -Value "a5725b99-0133-3c71-9434-ff3a416eb3b4" -Scope Global -Option ReadOnly
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# `ForwardChar` accepts the entire suggestion text when the cursor is at the end of the line.
# This custom binding makes `RightArrow` behave similarly - accepting the next word instead of the entire suggestion text.
Set-PSReadLineKeyHandler -Key RightArrow `
    -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
    -LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
    -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($cursor -lt $line.Length) {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    }
    else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
    }
}
function EnactorDB {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)][string]$Name
    )
    &lazysql mysql://enactor:$(Get-EnactorDBPass $Name)@$Name 
}
$global:UseOpenSSH = $true