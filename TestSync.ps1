### Initial Testing script for syncing directly from github
### This will use github credential manager

$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\Test-log.txt"

function pushPowerShell($commitMessage) {

    git status | out-file $outputFile
    git fetch | out-file $outputFile -append
    git pull | out-file $outputFile -append
    git status | out-file $outputFile -append
    git add .  | out-file $outputFile -append
    git commit -m "$commitMessage" | out-file $outputFile -append
    git status  | out-file $outputFile -append
    git push origin master  | out-file $outputFile -append
    git status  | out-file $outputFile -append
}

function randomLog ($logMessage) {
    write-output $logMessage | out-file $outputFile -append
}

pushPowerShell('testing auto download')
#randomLog("1234")

# via command line (powershell):
# powershell -command "& { . .\TestSync.ps1; randomLog '5678'}"
### the additional dot     ^   is to scope this part ^^^^^ to the current script
