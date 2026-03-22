Invoke-Expression (&starship init powershell)

$SITOConfig = @{
    keeper_splunkCredentials = "sa_itos_splunk_user"
    keeper_gkSSH_entry       = "gkSSH"
}
# $LockedSITOConfig = [System.Collections.ObjectModel.ReadOnlyDictionary[string,object]]::new(){
#     "keeper_splunkCredentials" = "sa_itos_splunk_user"
#     "keeper_gkSSH_entry" = "gkSSH"
# }
# $SITOConfig = [System.Collections.ObjectModel.ReadOnlyDictionary[string,object]]::new(
#     [System.Collections.Generic.Dictionary[string,object]]@{
#         "keeper_splunkCredentials" = "sa_itos_splunk_user"
#         "keeper_gkSSH_entry" = "gkSSH"
#     }
# )
Set-Variable -Name "JYSKPSRepoKey" -Value "a5725b99-0133-3c71-9434-ff3a416eb3b4" -Scope Global -Option ReadOnly
Set-Variable -Name "sito" -Value $SITOConfig -Scope Global -Option ReadOnly
Remove-Variable -Name "SITOConfig" -Scope Global -Force
import-module POSh-SSH

function Go-EnactorDb {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)][string]$Name
    )
    &~/.local/bin/lazysql mysql://enactor:$(Get-EnactorDBPass $Name)@$Name 
}
