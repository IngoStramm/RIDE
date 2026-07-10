param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^\d+\.\d+\.\d+$')]
    [string]$Version,

    [Parameter(Mandatory = $true)]
    [string]$Changelog,

    [switch]$Publish
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
Set-Location $repoRoot

function Write-Utf8NoBom {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Text
    )

    $encoding = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($Path, $Text, $encoding)
}

if ($Publish -and (git status --porcelain)) {
    throw 'Working tree must be clean before publishing.'
}

$tocPath = Join-Path $repoRoot 'RIDE.toc'
$toc = Get-Content -LiteralPath $tocPath -Raw
$toc = $toc -replace '(?m)^## Version: .+$', "## Version: $Version"
Write-Utf8NoBom -Path $tocPath -Text $toc

$changelogPath = Join-Path $repoRoot 'CHANGELOG.md'
$body = $Changelog -replace "`r`n", "`n"
$body = $body.Trim()
Write-Utf8NoBom -Path $changelogPath -Text "## $Version`n`n$body`n"

$readmePath = Join-Path $repoRoot 'README.md'
$readme = Get-Content -LiteralPath $readmePath -Raw
if ($readme -notmatch [regex]::Escape("### $Version")) {
    $readme = $readme -replace "`r`n", "`n"
    $marker = "The latest release changelog used by CurseForge and GitHub Releases is maintained in [CHANGELOG.md](CHANGELOG.md).`n`n"
    $entry = "### $Version`n`n$body`n`n"
    if ($readme.Contains($marker)) {
        $readme = $readme.Replace($marker, $marker + $entry)
        Write-Utf8NoBom -Path $readmePath -Text $readme
    }
}

npx.cmd --yes luaparse .\RIDE.lua > $null
git diff --check

if ($Publish) {
    git add RIDE.toc RIDE.lua CHANGELOG.md README.md .pkgmeta .github/workflows/release.yml scripts/release.ps1
    git commit -m "Release $Version"
    git push origin main
    git tag "v$Version"
    git push origin "v$Version"
}
else {
    Write-Host "Prepared release $Version. Review changes, then rerun with -Publish or commit/tag manually."
}
