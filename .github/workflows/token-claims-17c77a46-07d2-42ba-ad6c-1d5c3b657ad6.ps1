$token = Get-AzAccessToken

# Split JWT
$parts = $token.Token.Split('.')
$header = $parts[0]
$payload = $parts[1]

function Decode-Base64Url {
    param ($input)
    $remainder = $input.Length % 4
    if ($remainder -ne 0) {
        $input += '=' * (4 - $remainder)
    }
    $input = $input.Replace('-', '+').Replace('_', '/')
    [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($input))
}

$decodedHeader = Decode-Base64Url $header | ConvertFrom-Json
$decodedPayload = Decode-Base64Url $payload | ConvertFrom-Json

Write-Host "JWT Header:"
$decodedHeader | Format-List

Write-Host "`nJWT Payload (claims):"
$decodedPayload | Format-List
