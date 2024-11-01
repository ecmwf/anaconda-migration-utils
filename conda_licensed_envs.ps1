$user = if ($args.Count -gt 0) { $args[0] } else { $env:USERNAME }
$userHome = [System.IO.Path]::Combine("C:\Users", $user)
$environmentsFile = [System.IO.Path]::Combine($userHome, ".conda\environments.txt")

if (Test-Path $environmentsFile) {
    # Read each line from environments.txt
    Get-Content $environmentsFile | ForEach-Object {
        $envPath = $_
        
        # Check if the environment directory exists
        if (Test-Path $envPath) {
            # Check for any file in conda-meta directory containing repo.anaconda.com
            $condaMetaFiles = Get-ChildItem "$envPath\conda-meta\*" -ErrorAction SilentlyContinue
            $found = $false
            foreach ($file in $condaMetaFiles) {
                if (Select-String -Pattern "repo.anaconda.com/pkgs/" -Path $file.FullName -Quiet) {
                    Write-Output $envPath
                    $found = $true
                    break
                }
            }
        }
    }
}
