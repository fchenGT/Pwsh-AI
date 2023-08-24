function Select-Toggle(
    $Position, 
    [Array]$CurrentSelection
) {
    if ($CurrentSelection -contains $Position) { 
        $result = $CurrentSelection | Where-Object { $_ -ne $Position }
    }
    else {
        $CurrentSelection += $Position
        $result = $CurrentSelection
    }
    Return $Result
}
