$printername = "\\viking-print16\Front"

$printers = get-printer;
$index = 0;
foreach ($printer in $printers){
    if ($printer.Name -eq $printername)
        {
            #Write-Host $printer.Name + $index;
            break;
        }
    $index = $index + 1;
}



$registryPath = "HKCU:\Software\ABC System\General"
New-ItemProperty -Path $registryPath -Name "PrinterIndex" -Value $index -PropertyType DWORD -Force | Out-Null


#also set login id
#[HKEY_CURRENT_USER\Software\ABC System\Login Dialog]
#"Last Logged User"="jackie"