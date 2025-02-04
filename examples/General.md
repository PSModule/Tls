# Using Get-TLSConfig and Set-TLSConfig

## Get-TLSConfig

The `Get-TLSConfig` function retrieves the current TLS configuration or lists available TLS versions.

### Example 1: Get Current TLS Configuration

```powershell
Get-TLSConfig
```

**Description:** Returns the currently configured TLS version used by .NET applications.

### Example 2: List Available TLS Versions

```powershell
Get-TLSConfig -ListAvailable
```

**Description:** Lists all available TLS versions that can be configured.

---

## Set-TLSConfig

The `Set-TLSConfig` function allows enabling one or more TLS protocols by modifying the system's SecurityProtocol settings.

### Example 1: Enable TLS 1.2

```powershell
Set-TLSConfig -Protocol Tls12
```

**Description:** Enables TLS 1.2 as a supported security protocol.

### Example 2: Enable TLS 1.2 and TLS 1.3

```powershell
Set-TLSConfig -Protocol Tls12, Tls13
```

**Description:** Enables both TLS 1.2 and TLS 1.3 as supported security protocols.
