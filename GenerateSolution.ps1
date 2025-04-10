param(
	[string]$WorkingDirectory = "src"
)

if (Test-Path $WorkingDirectory) {
	Remove-Item -Path $WorkingDirectory -Recurse -Force
}

# Dictionary of DLLs with 'pretty' names
$dlls = @{
	"user32" = "UserInterface";
	"gdi32"	= "Graphics";
	"kernel32" = "Kernel";
	"advapi32" = "Advanced";
	"shell32" = "Shell";
	"bcrypt" = "Cryptography.BCrypt";
	"ncrypt" = "Cryptography.NCrypt";
	"crypt32" = "Cryptography.Legacy";
	"cabinet" = "Cabinet";
	"cfgmgr32" = "Hardware";
	"uxtheme" = "Themes";
	"ole32" = "ObjectLinking";
	"winusb" = "Usb";
	"setupapi" = "Setup";
	"msi" = "Installer";
	"magnification" = "Magnification";
	"ntdll" = "NewTechnology";
	"psapi" = "Process";
	"hid" = "Usb.HumanInterface";
	"dwmapi" = "Desktop";
	"mscoree" = "NETFramework";
	"netapi32" = "Network";
	"dbghelp" = "Debugging";
	"imagehlp" = "PEImage";
	"iphlpapi" = "Network.IPHelper";
	"newdev" = "NewDevice";
	"userenv" = "UserEnvironment";
	"wtsapi32" = "RemoteDesktop";
	"d3d9" = "DirectX.Direct3D.9";
	"d3d10" = "DirectX.Direct3D.10";
	"d3d10_1" = "DirectX.Direct3D.10.1";
	"d3d11" = "DirectX.Direct3D.11";
	"d3d12" = "DirectX.Direct3D.12";
	"ws2_32" = "Networking.Sockets";
	"wininet" = "Networking.Internet";
	"shlwapi" = "Shell.Lightweight";
	"comctl32" = "CommonControls";
	"oleaut32" = "ObjectLinking.Automation";
	"version" = "Version";
	"mpr" = "MultipleProviderRouter";
	"secur32" = "Security";
	"rpcrt4" = "Rpc";
	"winmm" = "Multimedia";
	"imm32" = "InputMethod";
	"dxgi" = "DirectX.GraphicsInfrastructure";
	"opengl32" = "Graphics.OpenGL";
	"glu32" = "Graphics.OpenGLUtility";
	"dsound" = "DirectX.DirectSound";
	"dinput8" = "DirectX.DirectInput";
	"mfplat" = "MediaFoundation.Platform";
	"mf" = "MediaFoundation";
	"mfreadwrite" = "MediaFoundation.ReadWrite";
	"avrt" = "Multimedia.Realtime";
	"ksuser" = "KernelStreaming";
}

$solutionName = "Riverside.Win32"
$solutionFile = Join-Path $WorkingDirectory "$solutionName.sln"

if (-not (Test-Path $WorkingDirectory)) {
	New-Item -ItemType Directory -Path $WorkingDirectory | Out-Null
}

.\WriteReadme.ps1 -IsGithub -DllDictionary $dlls

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
		<PackageTags>`$(PackageTags); $dll</PackageTags>
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
	"`$schema": "https://aka.ms/CsWin32.schema.json",
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

	# README.md
	.\WriteReadme.ps1 -LibraryName $projectName -DllName $dll -OutputDirectory $projectDir

	dotnet sln $solutionFile add $projectFile
}

# Create the main Riverside.Win32 project
$mainProjectName = "Riverside.Win32"
$mainProjectDir = Join-Path $WorkingDirectory $mainProjectName
$mainProjectFile = Join-Path $mainProjectDir "$mainProjectName.csproj"

if (-not (Test-Path $mainProjectDir)) {
	New-Item -ItemType Directory -Path $mainProjectDir | Out-Null
}

# Add main project .csproj content
$mainCsprojContent = @"
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<IncludeBuildOutput>false</IncludeBuildOutput>
		<IncludeSymbols>false</IncludeSymbols>
		<NoWarn>`$(NoWarn);NU5128</NoWarn>
	</PropertyGroup>
	<ItemGroup>
		<ProjectReference Include="..\Riverside.Win32.*\*.csproj" />
	</ItemGroup>
</Project>
"@
$mainCsprojContent | Set-Content -Path $mainProjectFile

.\WriteReadme.ps1 -IsMainProject -OutputDirectory $mainProjectDir

dotnet sln $solutionFile add $mainProjectFile

Write-Host "Solution and projects have been successfully created in $WorkingDirectory."