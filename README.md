# `Riverside.Win32`

---

This library offers static generations of P/Invoke for all languages using custom MSBuild tasks to build CsWin32 generations from metadata.
It uses custom PowerShell scripts and MSBuild tasks to build libraries, and is attached to a CD workflow that publishes the packages on NuGet.

You can then use the packages just as you would with CsWin32, but installing the correct package (relevant to the link library) to get the correct information.

| Package | Latest | Associated DLL |
|--------|--------|--------|
| Riverside.Win32.Usb.HumanInterface | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Usb.HumanInterface) | `hid.dll` |
| Riverside.Win32.DirectX.Direct3D.12 | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.12) | `d3d12.dll` |
| Riverside.Win32.Setup | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Setup) | `setupapi.dll` |
| Riverside.Win32.Shell | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Shell) | `shell32.dll` |
| Riverside.Win32.NETFramework | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NETFramework) | `mscoree.dll` |
| Riverside.Win32.Cabinet | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cabinet) | `cabinet.dll` |
| Riverside.Win32.Installer | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Installer) | `msi.dll` |
| Riverside.Win32.Cryptography.Legacy | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.Legacy) | `crypt32.dll` |
| Riverside.Win32.UserEnvironment | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.UserEnvironment) | `userenv.dll` |
| Riverside.Win32.Advanced | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Advanced) | `advapi32.dll` |
| Riverside.Win32.DirectX.Direct3D.11 | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.11) | `d3d11.dll` |
| Riverside.Win32.DirectX.Direct3D.10 | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.10) | `d3d10.dll` |
| Riverside.Win32.Hardware | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Hardware) | `cfgmgr32.dll` |
| Riverside.Win32.NewTechnology | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NewTechnology) | `ntdll.dll` |
| Riverside.Win32.DirectX.Direct3D.10.1 | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.10.1) | `d3d10_1.dll` |
| Riverside.Win32.UserInterface | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.UserInterface) | `user32.dll` |
| Riverside.Win32.Graphics | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Graphics) | `gdi32.dll` |
| Riverside.Win32.Process | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Process) | `psapi.dll` |
| Riverside.Win32.Magnification | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Magnification) | `magnification.dll` |
| Riverside.Win32.ObjectLinking | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.ObjectLinking) | `ole32.dll` |
| Riverside.Win32.Network | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Network) | `netapi32.dll` |
| Riverside.Win32.Debugging | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Debugging) | `dbghelp.dll` |
| Riverside.Win32.Cryptography.NCrypt | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.NCrypt) | `ncrypt.dll` |
| Riverside.Win32.RemoteDesktop | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.RemoteDesktop) | `wtsapi32.dll` |
| Riverside.Win32.DirectX.Direct3D.9 | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.DirectX.Direct3D.9) | `d3d9.dll` |
| Riverside.Win32.Desktop | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Desktop) | `dwmapi.dll` |
| Riverside.Win32.Kernel | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Kernel) | `kernel32.dll` |
| Riverside.Win32.PEImage | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.PEImage) | `imagehlp.dll` |
| Riverside.Win32.Network.IPHelper | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Network.IPHelper) | `iphlpapi.dll` |
| Riverside.Win32.NewDevice | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.NewDevice) | `newdev.dll` |
| Riverside.Win32.Themes | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Themes) | `uxtheme.dll` |
| Riverside.Win32.Usb | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Usb) | `winusb.dll` |
| Riverside.Win32.Cryptography.BCrypt | ![NuGet Version](https://img.shields.io/nuget/v/Riverside.Win32.Cryptography.BCrypt) | `bcrypt.dll` |
