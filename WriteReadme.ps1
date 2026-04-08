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

$text_summary = "This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata."
$text_crossLanguage = "You can use this library in any .NET language, including C#, Visual Basic, F#, IronPython, C++/CLI and others."
$text_usage = @"
The best way to consume Win32 P/Invoke APIs via this collection of libraries is by using the built-in alias system.
Since all P/Invoke APIs across all packages generate into the same ``Windows.Win32.PInvoke`` class, you must use the correct alias to reference the correct version of the ``PInvoke`` class to call the P/Invoke APIs for that API set (DLL).
For example, the following extract performs the [``SetPixel`` function from ``gdi32.dll``](https://learn.microsoft.com/en-gb/windows/win32/api/wingdi/nf-wingdi-setpixel):
``````cs
extern alias gdi32; // important: you must reference the appropriate alias for the API you are calling

gdi32::Windows.Win32.Graphics.Gdi.HDC context = new(nint.Zero); // the hdc (device context) parameter in SetPixel
int x = 1; // the x coordinate parameter in SetPixel
int y = 1; // the y coordinate parameter in SetPixel
gdi32::Windows.Win32.Foundation.COLORREF white = new(0x00FFFFFF); // the colour parameter in SetPixel

gdi32::Windows.Win32.Foundation.COLORREF pixel = gdi32::Windows.Win32.PInvoke(context, x, y, white);
``````

In practice, you might prefer to use a nicer, using statement, rather than repeating the alias throughout the document:
``````cs
extern alias gdi32;

using gdi32::Windows.Win32;

// Then you can reference the P/Invoke APIs like so:
PInvoke.SetPixel();
``````

Or, optionally, if you need access to P/Invoke APIs from multiple Win32 API sets but want to keep your codebase clean:
``````cs
extern alias gdi32;
extern alias advapi32;

using GraphicsPInvoke = gdi32::Windows.Win32.PInvoke;
using AdvancedPInvoke = advapi32::Windows.Win32.PInvoke;

GraphicsPInvoke.SetPixel();
AdvancedPInvoke.CreateService();
``````
"@

# Define the content of the README.md file based on the flags
if ($IsMainProject) {
    $readmeContent = @"
# ``Riverside.Win32``

---

$text_summary
This 'aggregate' package contains all the Win32 P/Invoke methods and supporting types generated from the [Win32 metadata repo](https://github.com/microsoft/win32metadata).

$text_crossLanguage
This library is the successor to the [PInvoke.NET](https://www.nuget.org/packages/PInvoke.Win32) project, enabling you to use Win32 P/Invoke in any .NET language.

---

$text_usage

---

*Learn more about the "Win32 P/Invoke bindings for .NET Standard" project [on GitHub](https://github.com/Lamparter/Win32).*
"@
} elseif ($IsGithub -and $DllDictionary) {
    $tableHeader = "| Package name | NuGet download | Associated API set |`n|--------|--------|--------|"
    
    # Sort by package name
    $sortedEntries = $DllDictionary.GetEnumerator() | Sort-Object Value
    
    $tableRows = foreach ($entry in $sortedEntries) {
        $key = $entry.Key
        $value = $entry.Value
        "| ``Riverside.Win32.$value`` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.$value)](https://nuget.org/packages/Riverside.Win32.$value) | <kbd>$key.dll</kbd> |"
    }
    $tableRows = $tableRows -join "`n"
    
    $readmeContent = @"
# ``Riverside.Win32``

#### Win32 P/Invoke bindings for .NET Standard.

---

$text_summary
It uses custom PowerShell scripts and MSBuild tasks to build libraries, and is attached to a CD workflow that publishes the packages on NuGet.

You can then use the packages just as you would with CsWin32, but installing the correct package (relevant to the link library) to get the correct information, or installing the ['aggregate' package](https://nuget.org/packages/Riverside.Win32) that contains all the Win32 P/Invoke methods and supporting types generated from the [Win32 metadata repo](https://github.com/microsoft/win32metadata).

---

$text_usage

---

$tableHeader
| ``Riverside.Win32`` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32)](https://nuget.org/packages/Riverside.Win32) | <kbd>*</kbd> |
$tableRows
"@
} else {
    $readmeContent = @"
# ``$LibraryName``

---

This package contains Win32 P/Invoke bindings for ``$DllName.dll``.
The package targets .NET Standard, meaning it can be used from any language in any .NET target framework, offering greater extensibility than CsWin32's C#-only source generator.

$text_crossLanguage

---

In order to correctly utilise types inside this library, you must use the ``$DllName`` alias in your code:
``````cs
extern alias $DllName;

$DllName::Windows.Win32.PInvoke.MyPInvokeApi();
``````

---

*Learn more about ``$LibraryName`` and other Win32 P/Invoke bindings for .NET Standard [on GitHub](https://github.com/Lamparter/Win32).*
"@
}

$readmePath = Join-Path -Path $OutputDirectory -ChildPath "README.md"
Set-Content -Path $readmePath -Value $readmeContent

Write-Host "README.md file has been generated successfully at '$readmePath'."