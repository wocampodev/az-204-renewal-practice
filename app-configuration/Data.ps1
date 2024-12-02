<#
.SYNOPSIS
	Set data in App Configuration Store
.DESCRIPTION
	This PowerShell script propulate key-value in our app configuration
.PARAMETER rg
	Set the resource group
.PARAMETER name
	Set the name of app configuration
.EXAMPLE
	PS> ./Data.ps1 -rg "az204-appconfig-rg" -name "az204-appconfig-20241201"
	   ...
.NOTES
	Author: Walter Ocampo
#>

param(
    [string]$rg = "", 
    [string]$name = ""
)

try {
    if ($rg -eq "" ) { $rg = Read-Host "Enter the resource group name" }
    if ($name -eq "" ) { $rg = Read-Host "Enter the app configuration name" }

    $appConfig = Get-AzAppConfigurationStore -ResourceGroupName $rg -Name $name 
    $endpoint = $appConfig.Endpoint 

    Set-AzAppConfigurationKeyValue -Endpoint $endpoint -Key "TestApp:Settings:Message" -Label "MyLabel" -Value "Hello Walter!"
    
	exit 0 # success
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
