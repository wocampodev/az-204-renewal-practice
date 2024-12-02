<#
.SYNOPSIS
	Create App Configuration Store
.DESCRIPTION
	This PowerShell script create app configuration store in your subscription
.PARAMETER rg
	Set the resource group
.PARAMETER name
	Set the name of app configuration
.EXAMPLE
	PS> ./Config.ps1 -rg "az204-appconfig-rg" -name "az204-appconfig-20241201"
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

    New-AzResourceGroup -Name $rg -Location eastus
    New-AzAppConfigurationStore -Name $name -ResourceGroupName $rg -Location eastus -Sku Standard
    
	exit 0 # success
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
