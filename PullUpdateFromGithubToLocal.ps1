$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\UpdateLocalRespository-log.txt"

Write-Output "************* Start" | out-file $outputFile -append
Write-Output "Starting download from github... at: $(Get-Date -format 'g')" | out-file $outputFile -append

# this will switch us back to master - we should NEVER navigate off of master on this server
# this will insure we don't
git checkout master
# this will nuke any local changes and force it back to a default state
git reset head --hard | out-file $outputFile -append
# this will check the server to insure we're reading the most current information
git fetch | out-file $outputFile -append
# this will pull files from the server, looking for any updates
git pull | out-file $outputFile -append
# this will log us a status which should always be something to the effect of "Your branch is up to date with 'origin/master'."
git status | out-file $outputFile -append
Write-Output "************* End" | out-file $outputFile -append