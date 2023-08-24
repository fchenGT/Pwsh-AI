<#
.SYNOPSIS
    Shows an interactive menu of AI generated PowerShell commands based on user input.

.DESCRIPTION
    Shows a list of AI generated PowerShell commands based on the user input. 
    User can select one of the commands to execute with Up and Down arrow keys. 
    The selected command will be executed in the Windows Terminal upon pressing Enter eky.
    Alternatively, user can press Esc key to exit the menu without executing any command.

.PARAMETER  Intention
    This is the user input of which the AI will generate the PowerShell command.

.PARAMETER  SuggestionCount
    This is the number of suggestions the AI will generate. Default is 3.

.INPUTS
    None. You cannot pipe objects to Use-PwshAI.

.OUTPUTS
    None. The output is directly executed in the Windows Terminal.

.LINK
    https://github.com/imfanchen/Pwsh-AI

.EXAMPLE
    Use-PwshAI "I want to get the IP address of the network adapter."

.EXAMPLE 
    Use-PwshAI "I want to get all the python file paths on my c drive" -SuggestionCount 5
#>
function Use-PwshAI {
    [CmdletBinding()]
    Param (
        [string]$Intention,
        [int]$SuggestionCount = 3
    )
    if (! $Intention) {
        Write-Warning "Please describe what you are trying to do in a single sentence."
        Return
    }

    $environmentKey = Get-Item -Path Env:\OPENAI_API_KEY
    $apiKey = $environmentKey.Value  
    if (!$apiKey) {
        Write-Warning "Enviroment Variable OpenAI_API_KEY is not set."
        $userKey = Read-Host "Please provide your own OpenAI API Key."
        if ($userKey -And $userKey.StartsWith("sk-")) {        
            [System.Environment]::SetEnvironmentVariable("OPENAI_API_KEY", $apiKey, [System.EnvironmentVariableTarget]::User)
            $apiKey = $userKey
        }
        else {
            Write-Error "Please go to https://help.openai.com/en/articles/4936850-where-do-i-find-my-secret-api-key"
            Return
        }
    }    

    $modelName = "gpt-3.5-turbo"
    $systemMessage = @{
        role    = "system"
        content = "You are an expert at using PowerShell commands. 
        Only provide a single executable line of PowerShell code as output. 
        Never output any text before or after the PowerShell Code, 
        as the output will be directly execute in the Windows Terminal. 
        You are allow to chain the commands with a pipe."
    }
    $userMessage = @{
        role    = "user"
        content = $Intention
    }    
    $messages = @($systemMessage, $userMessage);
    $body = @{
        model       = $modelName
        messages    = $messages
        temperature = 1
        max_tokens  = 2000
        n           = $SuggestionCount
    } | ConvertTo-Json

    $response = Invoke-RestMethod `
        -Uri "https://api.openai.com/v1/chat/completions" `
        -Method Post `
        -ContentType "application/json" `
        -Headers @{"Authorization" = "Bearer $apiKey" } `
        -Body $body

    $options = ($response.choices | Select-Object -ExpandProperty message | Select-Object -ExpandProperty content) | Sort-Object | Get-Unique -AsString

    if (! $options) {
        Write-Warning "No suggestion is Returned."
        Return
    }

    $command = Show-Menu $options;
    if ($command) {
        Invoke-Expression $command
    }
    else {
        $user = ([adsi]"LDAP://$(whoami /fqdn)").displayName
        Write-Host "Fan: Hi $user, hope you find what you are looking for."
    }
}
