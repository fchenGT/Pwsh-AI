#
# Module manifest for module 'PS-Menu'
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PwshAI.psm1'

    # Version number of this module.
    ModuleVersion     = '1.0.0'

    # ID used to uniquely identify this module
    GUID              = '0d48b9c6-41fd-11ee-be56-0242ac120002'

    # Author of this module
    Author            = 'Fan Chen'

    # Company or vendor of this module
    CompanyName       = ''

    # Copyright statement for this module
    Copyright         = '(c) github.com/imfanchen'

    # Description of the functionality provided by this module
    Description       = 'Powershell module to show interactive console menu with AI generated suggestions and execute selected command.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '4.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = 'ServerOpsMenu.Format.ps1xml'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @('Show-Menu', 'Show-PSAI', 'Use-PwshAI')

    # Cmdlets to export from this module
    # CmdletsToExport = '*'

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module
    # AliasesToExport = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @("Menu", "Console", "Interactive", 'AI', 'OpenAI', 'PsAI' , 'PswhAI', 'PowerShellAI')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/imfanchen/PwshAI'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

