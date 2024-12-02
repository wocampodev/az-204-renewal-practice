<#
.SYNOPSIS
	Get config from app configuration
.DESCRIPTION
	This PowerShell script run .NET consolo application with interact with app configuration
.PARAMETER rg
	Set the resource group
.PARAMETER name
	Set the name of app configuration
.EXAMPLE
	PS> ./Run.ps1 -rg "az204-appconfig-rg" -name "az204-appconfig-20241201"
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

    $result = Get-AzAppConfigurationStoreKey -Name $name -ResourceGroupName $rg
    $data = $result | Select-Object -First 1

	<#
    	$appConfig = Get-AzAppConfigurationStore -ResourceGroupName $rg -Name $name 
    	$endpoint = $appConfig.Endpoint 
		$keyValue = Get-AzAppConfigurationKeyValue -Endpoint $endpoint
		Write-Host $keyValue.value
	#>

    $Env:ConnectionString = $data.connectionString
    dotnet run
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
