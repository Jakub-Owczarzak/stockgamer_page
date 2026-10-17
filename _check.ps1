$html = [IO.File]::ReadAllText('c:\Users\sunsh\Desktop\app-train\index.html', [Text.Encoding]::UTF8)
try {
    $r = Invoke-RestMethod -Uri 'https://validator.w3.org/nu/' -Method Post -ContentType 'text/html; charset=utf-8' -Body $html
    $r | ConvertTo-Json -Depth 6 | Out-String | Write-Output
} catch {
    Write-Output ("VALIDATOR REQUEST FAILED: " + $_.Exception.Message)
}

