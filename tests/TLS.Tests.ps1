[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Pester code blocks'
)]
[CmdletBinding()]
param()

Describe 'Get-TLSConfig' {
    It 'Should return the current TLS configuration by default' {
        $result = Get-TLSConfig
        $expectedTypes = [System.Net.SecurityProtocolType]
        $result | Should -BeOfType $expectedTypes
    }

    It 'Should return available TLS versions when -ListAvailable is specified' {
        $result = Get-TLSConfig -ListAvailable
        $expectedValues = [enum]::GetValues([System.Net.SecurityProtocolType])
        $result | Should -Be $expectedValues
    }
}

Describe 'Set-TLSConfig' {
    BeforeAll {
        $originalTLS = [System.Net.ServicePointManager]::SecurityProtocol
    }

    AfterAll {
        [System.Net.ServicePointManager]::SecurityProtocol = $originalTLS
    }

    It 'Should enable TLS 1.2 when specified' {
        Set-TLSConfig -Protocol Tls12
        $result = [System.Net.ServicePointManager]::SecurityProtocol
        $result.HasFlag([System.Net.SecurityProtocolType]::Tls12) | Should -BeTrue
    }

    It 'Should enable multiple TLS versions when specified' {
        Set-TLSConfig -Protocol Tls12, Tls13
        $result = [System.Net.ServicePointManager]::SecurityProtocol
                ($result -band [System.Net.SecurityProtocolType]::Tls12) | Should -Be Tls12
                ($result -band [System.Net.SecurityProtocolType]::Tls13) | Should -Be Tls13
    }

    It 'Should not remove existing TLS settings when adding new ones' {
        Set-TLSConfig -Protocol Tls11
        $resultBefore = [System.Net.ServicePointManager]::SecurityProtocol
        Set-TLSConfig -Protocol Tls12
        $resultAfter = [System.Net.ServicePointManager]::SecurityProtocol
        $resultAfter.HasFlag([System.Net.SecurityProtocolType]::Tls11) | Should -BeTrue
        $resultAfter.HasFlag([System.Net.SecurityProtocolType]::Tls12) | Should -BeTrue
    }
}
