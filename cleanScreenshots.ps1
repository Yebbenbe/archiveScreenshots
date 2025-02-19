# For organizing screenshots.
# Checks if a subfolder with yesterday's date AS THE NAME exists. If not, moves screenshots and creates the folder.
#-------------------------------------------
$username = $env:USERNAME # pulls username
$screenshotFolder = "C:\Users\$username\Pictures\Screenshots" # pulls screenshots folder

# Get yesterday's date
$yesterday = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
$today = (Get-Date).ToString("yyyy-MM-dd")

# Create the new folder path for yesterday's screenshots
$newFolder = Join-Path -Path $screenshotFolder -ChildPath $yesterday

# Check if the folder for yesterday exists
if (-Not (Test-Path $newFolder)) {
    # create the folder for yesterday's screenshots
    New-Item -Path $newFolder -ItemType Directory -Force
    Write-Output "folder for yesterday created: $newFolder"
    Get-ChildItem -Path $screenshotFolder -File | Move-Item -Destination $newFolder
    Write-Output "Files moved to $newFolder"
} else {
    Write-Output "yesterday's folder exists already."
}
