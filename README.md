# Notepad++ Update Hijack Lab  

This lab is for emulating the hijack for notepad++ server that made a milicous update .

## Setup Instructions:
   - https://github.com/Oppenheim3r/Notepad-Hijacke-Lab.git
1. **On your  linux host :**
   - Run `chmod +x run_lab.sh`
   - Run `./run_lab.sh`

 ## you will need to have docker installed

2. **On your windows  Machine:**
   - ensure your `hosts` file points `notepad-plus-plus.org` to the server IP.
   - RUN `trust_cert.bat` as admin for the tls ssl cert 


3. **test the attack:**
   - then once connected just update the program i am using 8.8.1 version. ``https://notepad-plus-plus.org/downloads/v8.8.1/``
   - the update is ``malicious_update.exe`` its safe only a pop up ,but  you can choose a different executable that mine 
