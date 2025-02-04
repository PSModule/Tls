function Set-TLSConfig {
    <#
        .SYNOPSIS
        Configures the system to enable specific TLS protocols.

        .DESCRIPTION
        The Set-TLSConfig function allows enabling one or more TLS protocols by modifying the system's SecurityProtocol settings.
        This function updates the current security protocol settings without removing existing ones.

        .EXAMPLE
        Set-TLSConfig -Protocol Tls12

        Enables TLS 1.2 as a supported security protocol.

        .EXAMPLE
        Set-TLSConfig -Protocol Tls12, Tls13

        Enables both TLS 1.2 and TLS 1.3 as supported security protocols.

        .LINK
        https://psmodule.io/TLS/Functions/Set-TLSConfig/
    #>
    [OutputType([void])]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        # The TLS protocol to enable
        [Parameter(Mandatory)]
        [System.Net.SecurityProtocolType[]] $Protocol
    )

    foreach ($protocolItem in $Protocol) {
        Write-Verbose "Enabling $protocolItem"
        if ($PSCmdlet.ShouldProcess("Security Protocol to [$Protocol]", 'Set')) {
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor $protocolItem
        }
    }
}
