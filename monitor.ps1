while($true) {
    Write-Host "-----------------------------"
    Write-Host "Timestamp: $(Get-Date)"
    Write-Host "Disk Usage:"
    Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
        $total = $_.Used + $_.Free
        $used = $_.Used
        if ($total -ne 0) {
            $percentUsed = ($used / $total) * 100
        } else {
            $percentUsed = 0
        }
        Write-Host "$($_.Name): $used of $total used ($percentUsed%)"
    }
    Start-Sleep -Seconds 5
}