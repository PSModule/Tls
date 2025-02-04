# TLS

A PowerShell module that helps manage and configure TLS settings on your system.

## Prerequisites

This uses the following external resources:
- The [PSModule framework](https://github.com/PSModule) for building, testing and publishing the module.

## Installation

To install the module from the PowerShell Gallery, you can use the following command:

```powershell
Install-PSResource -Name TLS
Import-Module -Name TLS
```

## Usage

Below are some typical use cases for the module's functions:

### Example 1: Retrieve the Current TLS Configuration

```powershell
Get-TLSConfig
```

- Returns the TLS protocol(s) currently enabled for .NET applications on the system.

### Example 2: List All Available TLS Protocols

```powershell
Get-TLSConfig -ListAvailable
```

- Displays all TLS protocol types that can be potentially enabled.

### Example 3: Enable TLS 1.2

```powershell
Set-TLSConfig -Protocol Tls12
```

- Enables TLS 1.2 on the system without disabling previously enabled protocols.

### Example 4: Enable Multiple TLS Protocols (e.g., TLS 1.2 and TLS 1.3)

```powershell
Set-TLSConfig -Protocol Tls12, Tls13
```

- Simultaneously enables TLS 1.2 and TLS 1.3.

### Find more examples

To find more examples of how to use the module, please refer to the [examples](examples) folder.

Alternatively, you can run:
```powershell
Get-Command -Module TLS
```
to see all available commands in the module. Then, for any command, you can do:
```powershell
Get-Help -Examples <CommandName>
```
to view examples specific to that command.

## Documentation

Additional documentation, if available, can be found in this repository. Check out the function-level help by running:

```powershell
Get-Help Set-TLSConfig -Full
Get-Help Get-TLSConfig -Full
```

This will show detailed usage information and parameter descriptions.

## Contributing

Coder or not, you can contribute to the project! We welcome all contributions.

### For Users

If you don't code, you still have valuable insights. If you experience any unexpected behavior, see errors, or want additional functionality, please
submit a bug report or feature request via the Issues tab.

### For Developers

We’d love your help adding features, fixing bugs, and improving the module. Please read the [Contribution guidelines](CONTRIBUTING.md). You can pick
up an existing issue or submit a new one if you have ideas for improvements or new features.
