if ($host.Name -eq 'ConsoleHost') {
	# If you can't install the module. Just copy them from Johns-notebook directory
	# C:\Program Files\WindowsPowerShell\Modules\PSReadline to your homedir.
	Import-Module PSReadline

	# Disable Beep in terminal when erasing all text at the prompt with backspace.
	# https://superuser.com/questions/1113429/disable-powershell-beep-on-backspace
	Set-PSReadlineOption -BellStyle None
	
	# Set AutoComplete to work more like Bash.
	Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

	# Make Ctrl+D send exit just like in Bash.
	Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
}

# Chocolatey profile
$ChocolateyProfile = "$Env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Set the same prompt as on Linux.
# Based on: https://ss64.com/ps/syntax-prompt.html
function prompt {
	# Write home directory as ~ just like Bash.
	if ("$pwd" -eq "$Env:USERPROFILE") {
		$pwd_last_dir = '~'
	} else {
		$pwd_last_dir = $(($pwd -split '\\')[-1] -join '\')
	}
	
	$prompt = $Env:USERNAME + '@' + $Env:COMPUTERNAME + ' ' + $pwd_last_dir
	$host.ui.RawUI.WindowTitle = "PS $prompt"
	
	# To Print prompt with colors.
	# https://stackoverflow.com/questions/6297072/color-for-the-prompt-just-the-prompt-proper-in-cmd-exe-and-powershell
	Write-Host "[ $Env:USERNAME@" -NoNewLine -ForegroundColor White
	Write-Host "$Env:COMPUTERNAME " -NoNewLine -ForegroundColor White
	Write-Host "$pwd_last_dir" -NoNewLine -ForegroundColor Yellow
	Write-Host ']$' -NoNewLine -ForegroundColor White
	return ' '
}
