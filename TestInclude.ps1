$includeFiles = @()
$includeFiles += "C:\PowerShellTestingGround\PowerShellTesting\ReferenceScripts\TestSync.ps1"
$includeFiles += "C:\PowerShellTestingGround\PowerShellTesting\ReferenceScripts\TestLogging.ps1"

ForEach ($includedFile in $includeFiles) {
    if(Test-Path $includedFile) {
        . $includedFile
        write-host "cool, we added:  '$includedFile'"
    }
    else {
        # log an error
        Write-Output "Error In Script:  $MyInvocation.MyCommand.Name"
        Write-Output "Unable to find include file:  '$includedFile'" #| add logging
    }
}

# What I'd like to do here is get a standard set of functions that we include in all of the other files.
# This is following the idea of DRY coding (Don't Repeat Yourself) 
# Basically, have code in 1 place if at all possible - and I believe it is possible.
# We can have a general use (things like color) - Logging - AD Common - Database Common - etc, try to simplify individual scripts


# WHY INCLUDE INSTEAD OF POWERSHELL MODULE?
# I am not sure - I personally like the inclusion method (adding files at the top that you are including)
# this feels more 'right' in my coding brain.  
# Modules are ok - and I'm sure they'd work great - they just feel 'hidden' to me.  
# the above is abundantly clear WHAT you are including, easy to then go and find the target function(s)
# we can discuss

randomLog("this log called from include - inheriting sync")