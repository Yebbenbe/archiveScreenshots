# Screenshot Archiver
[Win 11] A simple PS script for those who use Snipping Tool with Auto-save enabled, and want some organization. Creates a subfolder within C:\Users\$user\Screenshots with yesterday's date, and moves all images into it. Designed to be run at login, everyday. Skips if has already been run.

## How it Works
- Script pulls the username, today's date and yesterday's date. Dates are formatted to string.
- the Screenshots folder path is dynamically constructed using the username
- a subfolder path is constructed by adding a child path of (yesterday's date)
- The script checks if there is already a subfolder titled (yesterday's date) at that path
- If not, the folder is created and all files within Screenshots are moved to it
- If subfolder already exists, script has already run today, and nothing is done.

## How to use
- Just copy the powershell script to your local machine, and save it somewhere you can remember.
- Use `Win + r` to open the run dialogue
- input `shell:startup`
- In this window, right-click and select **New**> **Shortcut**
- Location: `powershell.exe -ExecutionPolicy Bypass -File "C:\path\to\the\script.ps1"`
- Save it something recognizable.

![image](https://github.com/user-attachments/assets/c997b6ef-79dc-4e8a-a037-d9abff776b7b)
