<#
->Purpose:Genric function testing for getting systeminfo from one or more systems.

->Logic:Based on Principle of Mathemetical induction.P(1) is true,& so on for p(N)

->Author:Chandrakanth Senadhipatyam

->Upload to Github:02/21/2020

->Environment tested:Win 2012/2016,SQL 2012 & above,with Powershell 4.x+.#of database:100

#>

function Get-SystemInfo {
[CmdletBinding()]

param(
[Parameter(Mandatory=$True)][string]$computerName
)

$os = Get-WmiObject –Class Win32_OperatingSystem –Comp $computerName
$cs = Get-WmiObject –Class Win32_ComputerSystem –Comp $computerName

$props = @{'OSVersion'=$os.version;
'Model'=$cs.model;
'Manufacturer'=$cs.manufacturer;
'ComputerName'=$os.__SERVER;
'OSArchitecture'=$os.osarchitecture}
$obj = New-Object –TypeName PSObject –Property $props
Write-Output $obj

}