param (
    [string]$LibraryName,
    [string]$DllName,
    [string]$OutputDirectory = ".",
    [switch]$IsMainProject,
    [switch]$IsGithub,
    [hashtable]$DllDictionary
)

# Ensure the output directory exists
if (-not (Test-Path -Path $OutputDirectory)) {
    Write-Error "The specified output directory '$OutputDirectory' does not exist."
    exit 1
}

# Define the content of the README.md file based on the flags
if ($IsMainProject) {
    $readmeContent = @"
# ``Riverside.Win32``

---

This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata.
This 'aggregate' package contains all the Win32 P/Invoke methods and supporting types generated from the [Win32 metadata repo](https://github.com/microsoft/win32metadata).

You can use this library in any .NET language, including C#, Visual Basic, F#, IronPython, C++/CLI and others.
This library is the successor to the [PInvoke.NET](https://www.nuget.org/packages/PInvoke.Win32) project, enabling you to use Win32 P/Invoke in any .NET language.
"@
} elseif ($IsGithub -and $DllDictionary) {
    $tableHeader = "| Package | Latest | Associated DLL |`n|--------|--------|--------|"
    $tableRows = foreach ($key in $DllDictionary.Keys) {
        $value = $DllDictionary[$key]
        "| ``Riverside.Win32.$value`` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.$value)](https://nuget.org/packages/Riverside.Win32.$value) | <kbd>$key.dll</kbd> |"
    }
    $tableRows = $tableRows -join "`n"
    $readmeContent = @"
# ``Riverside.Win32``

---

This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata.
It uses custom PowerShell scripts and MSBuild tasks to build libraries, and is attached to a CD workflow that publishes the packages on NuGet.

You can then use the packages just as you would with CsWin32, but installing the correct package (relevant to the link library) to get the correct information.

$tableHeader
| ``Riverside.Win32`` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32)](https://nuget.org/packages/Riverside.Win32) | N/A |
$tableRows
"@
} else {
    $readmeContent = @"
# ``$LibraryName``

---

This package contains Win32 P/Invoke bindings for ``$DllName.dll``.
The package targets .NET Standard, meaning it can be used from any language in any .NET target framework, offering greater extensibility than CsWin32's C#-only source generator.

You can use this library in any .NET language, including C#, Visual Basic, F#, IronPython, C++/CLI and others.
"@
}

$readmePath = Join-Path -Path $OutputDirectory -ChildPath "README.md"
Set-Content -Path $readmePath -Value $readmeContent

Write-Host "README.md file has been generated successfully at '$readmePath'."