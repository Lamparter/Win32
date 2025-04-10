# `Riverside.Win32`

---

This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata.
It uses custom PowerShell scripts and MSBuild tasks to build libraries, and is attached to a CD workflow that publishes the packages on NuGet.

You can then use the packages just as you would with CsWin32, but installing the correct package (relevant to the link library) to get the correct information.

| Package | Latest | Associated DLL |
|--------|--------|--------|
| `Riverside.Win32` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32)](https://nuget.org/packages/Riverside.Win32) | <kbd>*</kbd> |
| `Riverside.Win32.Usb.HumanInterface` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Usb.HumanInterface)](https://nuget.org/packages/Riverside.Win32.Usb.HumanInterface) | <kbd>hid.dll</kbd> |
| `Riverside.Win32.DirectX.Direct3D.12` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.12)](https://nuget.org/packages/Riverside.Win32.DirectX.Direct3D.12) | <kbd>d3d12.dll</kbd> |
| `Riverside.Win32.Setup` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Setup)](https://nuget.org/packages/Riverside.Win32.Setup) | <kbd>setupapi.dll</kbd> |
| `Riverside.Win32.Shell` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Shell)](https://nuget.org/packages/Riverside.Win32.Shell) | <kbd>shell32.dll</kbd> |
| `Riverside.Win32.NETFramework` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NETFramework)](https://nuget.org/packages/Riverside.Win32.NETFramework) | <kbd>mscoree.dll</kbd> |
| `Riverside.Win32.Cabinet` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cabinet)](https://nuget.org/packages/Riverside.Win32.Cabinet) | <kbd>cabinet.dll</kbd> |
| `Riverside.Win32.Installer` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Installer)](https://nuget.org/packages/Riverside.Win32.Installer) | <kbd>msi.dll</kbd> |
| `Riverside.Win32.Cryptography.Legacy` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.Legacy)](https://nuget.org/packages/Riverside.Win32.Cryptography.Legacy) | <kbd>crypt32.dll</kbd> |
| `Riverside.Win32.UserEnvironment` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.UserEnvironment)](https://nuget.org/packages/Riverside.Win32.UserEnvironment) | <kbd>userenv.dll</kbd> |
| `Riverside.Win32.Advanced` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Advanced)](https://nuget.org/packages/Riverside.Win32.Advanced) | <kbd>advapi32.dll</kbd> |
| `Riverside.Win32.DirectX.Direct3D.11` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.11)](https://nuget.org/packages/Riverside.Win32.DirectX.Direct3D.11) | <kbd>d3d11.dll</kbd> |
| `Riverside.Win32.DirectX.Direct3D.10` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.10)](https://nuget.org/packages/Riverside.Win32.DirectX.Direct3D.10) | <kbd>d3d10.dll</kbd> |
| `Riverside.Win32.Hardware` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Hardware)](https://nuget.org/packages/Riverside.Win32.Hardware) | <kbd>cfgmgr32.dll</kbd> |
| `Riverside.Win32.NewTechnology` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NewTechnology)](https://nuget.org/packages/Riverside.Win32.NewTechnology) | <kbd>ntdll.dll</kbd> |
| `Riverside.Win32.DirectX.Direct3D.10.1` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.10.1)](https://nuget.org/packages/Riverside.Win32.DirectX.Direct3D.10.1) | <kbd>d3d10_1.dll</kbd> |
| `Riverside.Win32.UserInterface` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.UserInterface)](https://nuget.org/packages/Riverside.Win32.UserInterface) | <kbd>user32.dll</kbd> |
| `Riverside.Win32.Graphics` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Graphics)](https://nuget.org/packages/Riverside.Win32.Graphics) | <kbd>gdi32.dll</kbd> |
| `Riverside.Win32.Process` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Process)](https://nuget.org/packages/Riverside.Win32.Process) | <kbd>psapi.dll</kbd> |
| `Riverside.Win32.Magnification` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Magnification)](https://nuget.org/packages/Riverside.Win32.Magnification) | <kbd>magnification.dll</kbd> |
| `Riverside.Win32.ObjectLinking` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.ObjectLinking)](https://nuget.org/packages/Riverside.Win32.ObjectLinking) | <kbd>ole32.dll</kbd> |
| `Riverside.Win32.Network` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Network)](https://nuget.org/packages/Riverside.Win32.Network) | <kbd>netapi32.dll</kbd> |
| `Riverside.Win32.Debugging` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Debugging)](https://nuget.org/packages/Riverside.Win32.Debugging) | <kbd>dbghelp.dll</kbd> |
| `Riverside.Win32.Cryptography.NCrypt` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.NCrypt)](https://nuget.org/packages/Riverside.Win32.Cryptography.NCrypt) | <kbd>ncrypt.dll</kbd> |
| `Riverside.Win32.RemoteDesktop` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.RemoteDesktop)](https://nuget.org/packages/Riverside.Win32.RemoteDesktop) | <kbd>wtsapi32.dll</kbd> |
| `Riverside.Win32.DirectX.Direct3D.9` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.9)](https://nuget.org/packages/Riverside.Win32.DirectX.Direct3D.9) | <kbd>d3d9.dll</kbd> |
| `Riverside.Win32.Desktop` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Desktop)](https://nuget.org/packages/Riverside.Win32.Desktop) | <kbd>dwmapi.dll</kbd> |
| `Riverside.Win32.Kernel` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Kernel)](https://nuget.org/packages/Riverside.Win32.Kernel) | <kbd>kernel32.dll</kbd> |
| `Riverside.Win32.PEImage` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.PEImage)](https://nuget.org/packages/Riverside.Win32.PEImage) | <kbd>imagehlp.dll</kbd> |
| `Riverside.Win32.Network.IPHelper` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Network.IPHelper)](https://nuget.org/packages/Riverside.Win32.Network.IPHelper) | <kbd>iphlpapi.dll</kbd> |
| `Riverside.Win32.NewDevice` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NewDevice)](https://nuget.org/packages/Riverside.Win32.NewDevice) | <kbd>newdev.dll</kbd> |
| `Riverside.Win32.Themes` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Themes)](https://nuget.org/packages/Riverside.Win32.Themes) | <kbd>uxtheme.dll</kbd> |
| `Riverside.Win32.Usb` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Usb)](https://nuget.org/packages/Riverside.Win32.Usb) | <kbd>winusb.dll</kbd> |
| `Riverside.Win32.Cryptography.BCrypt` | [![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.BCrypt)](https://nuget.org/packages/Riverside.Win32.Cryptography.BCrypt) | <kbd>bcrypt.dll</kbd> |
