function Get-TLSConfig {
    <#
        .SYNOPSIS
        Retrieves the current TLS configuration or lists available TLS versions.

        .DESCRIPTION
        This function returns the currently configured TLS version used by .NET applications.
        If the -ListAvailable parameter is specified, it lists all available TLS versions supported.

        .EXAMPLE
        Get-TLSConfig

        Returns the currently configured TLS version.

        .EXAMPLE
        Get-TLSConfig -ListAvailable

        Lists all available TLS versions that can be configured.

        .LINK
        https://psmodule.io/TLS/Functions/Get-TLSConfig/
    #>
    [OutputType(ParameterSetName = 'Default', [System.Net.SecurityProtocolType])]
    [OutputType(ParameterSetName = 'ListAvailable', [Array])]
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param(
        # List available TLS configurations
        [Parameter(ParameterSetName = 'ListAvailable')]
        [switch] $ListAvailable
    )

    if ($ListAvailable) {
        return [enum]::GetValues([System.Net.SecurityProtocolType])
    }
    return [System.Net.ServicePointManager]::SecurityProtocol
}
