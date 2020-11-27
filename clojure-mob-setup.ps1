# This script
# iwr -useb https://raw.githubusercontent.com/watchtheblur/clojure-mob-setup/main/clojure-mob-setup.ps1 | iex

#Requires -RunAsAdministrator

iwr -useb cin.st | iex
choco feature enable --name=allowGlobalConfirmation
cinst win-no-annoy
cinst vscode
cinst googlechrome
cinst git 
cinst notepad2-mod
choco install anydesk.install

# delete annoying Windows notification sounds
Remove-Item -ErrorAction SilentlyContinue -Recurse HKCU:\AppEvents\Schemes
Set-Service Audiosrv -StartupType Automatic

# Show seconds in the clock so screen sharing latency is obvious to all
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced ShowSecondsInSystemClock 1

@(
    'MS-vsliveshare.vsliveshare-pack'
    'betterthantomorrow.calva'
    'ms-vscode.powershell'
    'vscode-icons-team.vscode-icons'
) | % { & "C:\Program Files\Microsoft VS Code\bin\code.cmd" --install-extension $_ }

$ProgressPreference = 'SilentlyContinue'

& "${env:ProgramFiles}\Google\Chrome\Application\chrome.exe" https://app.mindmup.com/map/new

# Often fails because anydesk chocolate authoring is bad
# check if this is true
# cinst beyondcompare
# cinst git poshgit github-desktop