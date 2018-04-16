### Initial Testing script for syncing directly from github
### This will use github credential manager


#$cmd = 'git status'
#$arg1 = 'status'
#$arg2 = '/f'
#$arg3 = '$MySourceDirectory\src\Deployment\Installations.xml'

#& $cmd #$arg1 #$arg2 $arg3
$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\Test-log.txt"
$commitMessage = "initial testing, weeee!"

git status | out-file $outputFile
git fetch | out-file $outputFile -append
git pull | out-file $outputFile -append
git status | out-file $outputFile -append
git add .  | out-file $outputFile -append
git commit -m "$commitMessage" | out-file $outputFile -append
git status  | out-file $outputFile -append
git push origin master  | out-file $outputFile -append
git status  | out-file $outputFile -append