# Set the path to the folder where the files are located
$folderPath = "ADD YOUR PATH HERE"

# Get all of the files in the folder
$files = Get-ChildItem $folderPath

# Loop through each file
foreach ($file in $files) {
  # Get the extension of the file
  $ext = $file.Extension

  # Check if a folder with this extension already exists
  if (-not (Test-Path "$folderPath\$ext")) {
    # If not, create a new folder with this name
    New-Item -ItemType Directory -Path "$folderPath\$ext"
  }

  # Move the file to the folder with the same extension
  Move-Item $file.FullName "$folderPath\$ext\"
}
