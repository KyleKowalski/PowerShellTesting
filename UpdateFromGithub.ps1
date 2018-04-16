$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\UpdateLocalRespository-log.txt"

git fetch | out-file $outputFile -append
git pull | out-file $outputFile -append
git status | out-file $outputFile -append