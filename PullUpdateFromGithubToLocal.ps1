$outputFile = "C:\PowerShellTestingGround\PowerShellLogs\UpdateLocalRespository-log.txt"

Write-Output "************* Start" | out-file $outputFile -append
Write-Output "Starting download from github... at: $(Get-Date -format 'g')" | out-file $outputFile -append

### begin state cleanup to insure where where we want to be
# this will nuke any local changes to where we are and force it back to a default state 
# in the event we are on a different branch with changes (should never happen)
# this will allow us to switch to master under all circumstances (no local changes cached to prevent switch)
#### git reset head --hard | out-file $outputFile -append # disabled for alternative KK 2018-04-25

# alternatively, it might be better to do an auto commit instead and keep your local branch intact.
git add .
git commit -m "auto commit from login script at: $(Get-Date -format 'g')"

# which is better?  keep local changes that may be incomplete or accidental?  Or nuke changes?  
# TODO:  Build some better logic around this.  
# Logic...
#############
## If on branch master
#### if no changes go to end
#### else if changes ?????
## else if not on master
### if no changes - switch to master
### else if changes ????  & switch to master
# in all cases pull master
#############

# this will switch us back to master - we should never navigate off of master on this server
# and this will insure we don't
git checkout master

# this will nuke any local changes to master and force it back to a default state
# again should NOT happen, but now we'll be sure
git reset head --hard | out-file $outputFile -append

### now that we're home and clean - begin the actual sync process
# this will check the server to insure we're reading the most current information
git fetch | out-file $outputFile -append
# this will pull files from the server, looking for any updates
git pull | out-file $outputFile -append
# this will log us a status which should always be something to the effect of "Your branch is up to date with 'origin/master'."
git status | out-file $outputFile -append

Write-Output "************* End" | out-file $outputFile -append