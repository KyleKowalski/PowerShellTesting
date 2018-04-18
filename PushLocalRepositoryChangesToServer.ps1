$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\UpdateLocalRespository-log.txt"

Write-Output "************* Start" | out-file $outputFile -append
Write-Output "Starting upload to github... at: $(Get-Date -format 'g')" | out-file $outputFile -append

git status | out-file $outputFile -append
git add . | out-file $outputFile -append
git commit -m "$commitMessage" | out-file $outputFile -append
git status | out-file $outputFile -append
git push origin master  | out-file $outputFile -append
git status | out-file $outputFile -append

Write-Output "************* End" | out-file $outputFile -append