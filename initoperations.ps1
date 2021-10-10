$scriptFolder = (Get-Item -Path ".\" -Verbose).FullName

[string]$oldPath = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment" -Name PATH).path

if ($oldPath.Contains("\operations\scripts")) {
  Write-Output "The operation scripts were already in the envrionment path."
} else {
  $newPath =  "$oldPath;$scriptFolder\scripts"
  Set-ItemProperty -Path 'Registry::KEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -NAME PATH -Value $newPath
  Write-Output "Added new environment path for operations scirpts."
}