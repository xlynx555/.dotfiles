# 1. install hashicorp vault with homebrew
brew tap hashicorp/tap
brew install hashicorp/tap/vault

# 2. Run powershell script block
pwsh -Command {
    $JyskRepo = @{
        Name = 'JYSK'
        SourceLocation = 'https://psrepository.jysk.com/repository/ps-repo/'
        ScriptSourceLocation = 'https://psrepository.jysk.com/repository/ps-repo/'
        InstallationPolicy = 'Trusted'
    }
    Unregister-PSRepository -Name JYSK
    Register-PSRepository @JyskRepo 
    Install-Module -Name PSReadLine -AllowPrerelease -Force -scope CurrentUser
    Install-Module -Name GK-Database-Helper -Force -Scope CurrentUser
    Install-Module -Name JYSK-Core -Force -Scope CurrentUser
    Install-Module -Name JYSK-Alias -Force -Scope CurrentUser
    Install-Module -Name JYSK-SecretsManager -Force -Scope CurrentUser
    Install-Module -Name JYSK-Slack -Force -Scope CurrentUser
    Install-Module -Name JYSK-Snippets -Force -Scope CurrentUser
    Install-Module -Name Enactor-Snippets -Force -Scope CurrentUser
    Install-Module -Name myjysk -Force -Scope CurrentUser
    Install-Module -Name OverviewMod -Force -Scope CurrentUser
    Install-Module -Name Posh-SSH -Force -Scope CurrentUser
}

