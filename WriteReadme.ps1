param (
    [string]$LibraryName,
    [string]$DllName,
    [string]$OutputDirectory = ".",
    [switch]$IsMainProject
)

# Ensure the output directory exists
if (-not (Test-Path -Path $OutputDirectory)) {
    Write-Error "The specified output directory '$OutputDirectory' does not exist."
    exit 1
}

# Define the content of the README.md file based on the IsMainProject flag
if ($IsMainProject) {
    $readmeContent = @"
# ``Riverside.Win32``

---

This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata.
It uses custom PowerShell scripts and MSBuild tasks to build libraries, and is attached to a CD workflow that publishes the packages on NuGet.

You can then use the packages just as you would with CsWin32, but installing the correct package (relevant to the link library) to get the correct information.
"@
} else {
    $readmeContent = @"
# ``$LibraryName``

---

This NuGet package contains Win32 P/Invoke bindings for ``$DllName.dll``.
"@
}

$readmePath = Join-Path -Path $OutputDirectory -ChildPath "README.md"
Set-Content -Path $readmePath -Value $readmeContent

Write-Host "README.md file has been generated successfully at '$readmePath'."