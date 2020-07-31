function Get-ConferenceSession {

    <#
        .SYNOPSIS
        Finds session information using the presenter name or a topic keyword.

        .DESCRIPTION
        Finds session information using the presenter name or a topic keyword.

        .PARAMETER Presenter
        This is an exact string match of the presenter name for the session.
        Part of the 'Presenter' parameter set.

        .PARAMETER Topic
        This will display sessions matching the topic keyword.
        Part of the 'Topic' parameter set.

        .OUTPUTS
        PSCustomObject of the matching session information.

        .EXAMPLE
        Get-ConferenceSession -Presenter "Jeff Brown"

        This example will return any matching sessions where 'Jeff Brown' is the presenter.

        .EXAMPLE
        Get-ConferenceSession -Topic "azure"

        This example will return any matching sessions where 'azure' is in the session title.    
    #>

    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = "Presenter")]
        [string]
        $Presenter,

        [Parameter(ParameterSetName = "Topic")]
        [string]
        $Topic
    )

    $sessionsArray = @(
        [PSCustomObject]@{
            "Time" = "8:00 AM"
            "Presenter" = @("Jeffery Snover")
            "Title" = "Keynote"
        },
        [PSCustomObject]@{
            "Time" = "9:15 AM"
            "Presenter" = @("Frank Lesniak", "David Wiggs")
            "Title" = "Rapid Function Development"
        },
        [PSCustomObject]@{
            "Time" = "10:10 AM"
            "Presenter" = @("Jeff Hicks")
            "Title" = "Building a Better Module Structure"
        },
        [PSCustomObject]@{
            "Time" = "11:05 AM"
            "Presenter" = @("James Petty")
            "Title" = "Securing PSRemoting"
        },
        [PSCustomObject]@{
            "Time" = "12:00 PM"
            "Presenter" = @("Lee Berg")
            "Title" = "Purpose build PowerShell script orchestration with Universal Automation"
        },
        [PSCustomObject]@{
            "Time" = "12:55 PM"
            "Presenter" = @("Kyle Ruddy")
            "Title" = "Manage vSphere with PowerCLI DSC Resources, Finally!"
        },
        [PSCustomObject]@{
            "Time" = "1:50 PM"
            "Presenter" = @("Adam Bertram")
            "Title" = "Azure DevOps Pipelines for the Infrastructure Automator"
        },
        [PSCustomObject]@{
            "Time" = "2:45 PM"
            "Presenter" = @("David Wiggs")
            "Title" = "Azure Administration Using Azure Functions and Logic Apps"
        },
        [PSCustomObject]@{
            "Time" = "3:40 PM"
            "Presenter" = @("Joseph Houghes")
            "Title" = "GitHub Actions to Automate Terraform for Azure"
        },
        [PSCustomObject]@{
            "Time" = "4:35 PM"
            "Presenter" = @("Jeff Brown")
            "Title" = "Publishing Your First Package to the PowerShell Gallery"
        }
    )

    if ($PSBoundParameters.ContainsKey('Presenter')) {
        foreach ($session in $sessionsArray) {
            if ($session.Presenter -contains $Presenter) {
                $session
            }
        }
    }

    if ($PSBoundParameters.ContainsKey('Topic')) {
        foreach ($session in $sessionsArray) {
            if ($session.Title -like "*$Topic*") {
                $session
            }
        }
    }
}

function Get-Sponsors {
    <#
        .SYNOPSIS
        Displays the sponsors of the Chicago PowerShell conference.

        .DESCRIPTION
        Displays the sponsors of the Chicago PowerShell conference.

        .OUTPUTS
        System.Object[]

        .EXAMPLE
        Get-Sponsors

        This example will display the sponsors and their websites.
    #>

    [CmdletBinding()]
    param()

    $sponsorsArray = @(
        [PSCustomObject]@{
            Name = "System Frontier"
            Website = "https://systemfrontier.com"
        },
        [PSCustomObject]@{
            Name = "West Monroe"
            Website = "https://westmonroepartners.com"
        },
        [PSCustomObject]@{
            Name = "Ironman Software"
            Website = "https://ironmansoftware.com"
        },
        [PSCustomObject]@{
            Name = "Script Runner"
            Website = "https://scriptrunner.com/en"
        },
        [PSCustomObject]@{
            Name = "PluralSight"
            Website = "https://pluralsight.com"
        }
    )

    $sponsorsArray
}

function Set-MySchedule {
    <##>

    [CmdletBinding()]
    param ()

    $sessionsArray = [System.Collections.ArrayList]@(
        [PSCustomObject]@{
            "SessionId" = 1
            "Time" = "8:00 AM"
            "Presenter" = @("Jeffery Snover")
            "Title" = "Keynote"
        },
        [PSCustomObject]@{
            "SessionId" = 2
            "Time" = "9:15 AM"
            "Presenter" = @("Frank Lesniak", "David Wiggs")
            "Title" = "Rapid Function Development"
        },
        [PSCustomObject]@{
            "SessionId" = 3
            "Time" = "10:10 AM"
            "Presenter" = @("Jeff Hicks")
            "Title" = "Building a Better Module Structure"
        },
        [PSCustomObject]@{
            "SessionId" = 4
            "Time" = "11:05 AM"
            "Presenter" = @("James Petty")
            "Title" = "Securing PSRemoting"
        },
        [PSCustomObject]@{
            "SessionId" = 5
            "Time" = "12:00 PM"
            "Presenter" = @("Lee Berg")
            "Title" = "Purpose build PowerShell script orchestration with Universal Automation"
        },
        [PSCustomObject]@{
            "SessionId" = 6
            "Time" = "12:55 PM"
            "Presenter" = @("Kyle Ruddy")
            "Title" = "Manage vSphere with PowerCLI DSC Resources, Finally!"
        },
        [PSCustomObject]@{
            "SessionId" = 7
            "Time" = "1:50 PM"
            "Presenter" = @("Adam Bertram")
            "Title" = "Azure DevOps Pipelines for the Infrastructure Automator"
        },
        [PSCustomObject]@{
            "SessionId" = 8
            "Time" = "2:45 PM"
            "Presenter" = @("David Wiggs")
            "Title" = "Azure Administration Using Azure Functions and Logic Apps"
        },
        [PSCustomObject]@{
            "SessionId" = 9
            "Time" = "3:40 PM"
            "Presenter" = @("Joseph Houghes")
            "Title" = "GitHub Actions to Automate Terraform for Azure"
        },
        [PSCustomObject]@{
            "SessionId" = 10
            "Time" = "4:35 PM"
            "Presenter" = @("Jeff Brown")
            "Title" = "Publishing Your First Package to the PowerShell Gallery"
        }
    )

    $mySchedule = [System.Collections.ArrayList]@()
    $continue = $true
    $sessionsArray | Out-Host

    while ($continue) {
        
        $sessionToAdd = Read-Host -Prompt "Enter the SessionId to add to your schedule, or press Q to quit"

        if ($sessionToAdd -in $sessionsArray.SessionId) {
            $selectedSession = $sessionsArray | Where-Object {$_.SessionId -eq $sessionToAdd}
            $mySchedule.Add($selectedSession) | Out-Null
            $sessionsArray.Remove($selectedSession)
            $sessionsArray | Out-Host
        }
        elseif ($sessionToAdd -ilike 'q') {
            $continue = $false
        }
        else {
            Write-Warning -Message "Invalid Session Id or option, please try again."
        }
    }

    Write-Output "`n`nYour Chicago PowerShell 2020 Schedule"
    Write-Output "*************************************"
    $mySchedule | Out-Host
}