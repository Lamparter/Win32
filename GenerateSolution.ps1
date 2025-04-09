param(
    [string]$WorkingDirectory = "src"
)

if (Test-Path $WorkingDirectory) {
    Remove-Item -Path $WorkingDirectory -Recurse -Force
}

# Dictionary of DLLs with 'pretty' names
$dlls = @{
    "user32"   = "UserInterface";
    "gdi32"    = "Graphics";
    "kernel32" = "Kernel";
    "advapi32" = "Advanced";
    "shell32"  = "Shell";
    "bcrypt"  = "Cryptography.BCrypt";
    "ncrypt"  = "Cryptography.NCrypt";
    "crypt32" = "Cryptography.Legacy";
    "cabinet" = "Cabinet";
    "cfgmgr32" = "Configuration";
    "uxtheme" = "Themes";
    "ole32"   = "ObjectLinking";
    "winusb" = "Usb";
    "setupapi" = "Setup";
    "msi" = "Installer";
    "magnification" = "Magnification";
    "ntdll" = "NewTechnology";
    "psapi" = "Process";
    "hid" = "HumanInterface";
    "dwmapi" = "Desktop";
    "mscoree" = "NETFramework";
    "netapi32" = "Network";
    "dbghelp" = "Debugging";
    "imagehlp" = "Image";
    "iphlpapi" = "IPHelper";
    "newdev" = "NewDevice";
    "userenv" = "UserEnvironment";
    "wtsapi32" = "RemoteDesktop";
}

$solutionName = "Riverside.Win32"
$solutionFile = Join-Path $WorkingDirectory "$solutionName.sln"

if (-not (Test-Path $WorkingDirectory)) {
    New-Item -ItemType Directory -Path $WorkingDirectory | Out-Null
}

dotnet new sln -n $solutionName -o $WorkingDirectory

foreach ($dll in $dlls.Keys) {
    $prettyName = $dlls[$dll]
    $projectName = "$solutionName.$prettyName"
    $projectDir = Join-Path $WorkingDirectory $projectName
    $projectFile = Join-Path $projectDir "$projectName.csproj"
    $nativeMethodsFile = Join-Path $projectDir "NativeMethods.txt"
    $nativeMethodsConfigFile = Join-Path $projectDir "NativeMethods.json"

    if (-not (Test-Path $projectDir)) {
        New-Item -ItemType Directory -Path $projectDir | Out-Null
    }

    # Generate project file
    dotnet new classlib -n $projectName -o $projectDir
    Remove-Item (Join-Path $projectDir "Class1.cs") -Force

    # Add .csproj content
    $csprojContent = @"
<Project Sdk="Microsoft.NET.Sdk">
    <PropertyGroup>
        <Description>Win32 P/Invoke ($dll.dll) bindings for .NET Standard</Description>
    </PropertyGroup>
</Project>
"@
    $csprojContent | Set-Content -Path $projectFile

    # NativeMethods.txt
    $nativeMethodsContent = "$dll.*"
    $nativeMethodsContent | Set-Content -Path $nativeMethodsFile
    
    # NativeMethods.json
    $nativeMethodsConfigContent = @"
{
    "$schema": "https://aka.ms/CsWin32.schema.json",
    "allowMarshaling": false,
    "public": true,
    "comInterop": {
        "preserveSigMethods": [
            "*"
        ]
    }
}
"@
    $nativeMethodsConfigContent | Set-Content -Path $nativeMethodsConfigFile

    dotnet sln $solutionFile add $projectFile
}

Write-Host "Solution and projects have been successfully created in $WorkingDirectory."