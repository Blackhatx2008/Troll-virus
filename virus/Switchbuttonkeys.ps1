Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseSettings {
    [DllImport("user32.dll")]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);
}
"@

$SPI_SETMOUSEBUTTONSWAP = 0x0021
$SPIF_SENDCHANGE = 0x02

[MouseSettings]::SystemParametersInfo($SPI_SETMOUSEBUTTONSWAP, 1, [IntPtr]::Zero, $SPIF_SENDCHANGE)