<#
.SYNOPSIS
    Alias for Use-PwshAI function.

.DESCRIPTION
    This is an shorthand alias for Use-PwshAI function.
    Input does not need to be quoted.
    Suggestion count is 5 by default. 

.INPUTS
    None. You cannot pipe objects to Use-PwshAI.

.OUTPUTS
    None. The output is directly executed in the Windows Terminal.

.LINK
    https://github.com/imfanchen/Pwsh-AI

.EXAMPLE
    Use-PsAI I want to get the IP address of the network adapter.

.EXAMPLE 
    Use-PsAI I want to get all the python file paths on my c drive.
#>

function Show-PSAI {
    [CmdletBinding()]
    $query = ''
    $args | ForEach-Object { $query += "$_ " }
    Use-PwshAI -Intention $query -SuggestionCount 5
}