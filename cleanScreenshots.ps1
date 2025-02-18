# For organizing screenshots.
# checks last modified date on screenshots folder. If it was yesterday, creates new subfolder with yesterday's date
# Pushes all screenshots to that subfolder
#-------------------------------------------
$username = $env:USERNAME #pulls username
$screenshotFolder = "C:\Users\$username\Pictures\Screenshots" # pulls screenshots folder
# get yesterday and today
$yesterday = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
$today = (Get-Date).ToString("yyyy-MM-dd")
# get the last modified date of the Screenshots folder
$folderLastModified = (Get-Item $screenshotFolder).LastWriteTime.ToString("yyyy-MM-dd")

# Debug, puts last mod date
Write-Output "Last modified date of Screenshots folder: $folderLastModified"

# Check if the folder was modified yesterday
if ($folderLastModified -eq $yesterday) {
    # If the folder was modified yesterday, it's the first login of the day
    Write-Output "It’s the first login of the day. Folder was modified yesterday."
    # Create the new folder path for yesterday's screenshots
    $newFolder = Join-Path -Path $screenshotFolder -ChildPath $yesterday    
    # Check if the folder for yesterday exists
    if (-Not (Test-Path $newFolder)) { # if not exists
        New-Item -Path $newFolder -ItemType Directory -Force # write the new path
        Write-Output "Folder for yesterday was created: $newFolder" # debug info
    } else {
        Write-Output "Folder for yesterday already exists: $newFolder" # debug info, this else clause can be removed
    }
    # gets the path of the subfolder, then moves to it. 
    Get-ChildItem -Path $screenshotFolder -File | Move-Item -Destination $newFolder
    Write-Output "Files moved to $newFolder"
} else {
    Write-Output "It’s not the first login of the day. Folder was last modified on $folderLastModified."
}
