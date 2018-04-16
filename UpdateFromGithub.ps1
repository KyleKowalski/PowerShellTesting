$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\UpdateLocalRespository-log.txt"

Write-Output "************* Start" | out-file $outputFile -append
Write-Output "Starting download from github... at: $(Get-Date -format 'g')" | out-file $outputFile -append

git fetch | out-file $outputFile -append
git pull | out-file $outputFile -append
git status | out-file $outputFile -append
Write-Output "************* End" | out-file $outputFile -append