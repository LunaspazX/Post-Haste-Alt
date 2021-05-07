$projectName = Read-Host 'Name your project'

$date = Get-date -Format 'dd-MM-yyyy'

$rootName = "$projectName ($date)"

$subFolders = 'footage', 'music', 'export'

$customFolderArr = @()

$customFolderArr2 = @()

$rootPath = '_______' #Add path here

$ass = '_____' #copy the ass folder path in here

function makeFolder {
    param(
        $path,
        $name,
        $type = 'Directory'
    )
    New-Item -path $path -name $name -ItemType $type
}

makeFolder -path $rootPath -name $rootName

foreach ($subFolder in $subFolders) {
    makeFolder -path $rootPath\$rootName -name $subFolder
}

do {
    $customFolders = Read-Host 'add cusotm folder in fooatge folder'
    if ($customFolders) {
        $customFolderArr += $customFolders
    }
}
until($customFolders -eq '')

foreach ($customFolder in $customFolderArr) {
    makeFolder -path $rootPath\$rootName\footage -name $customFolder
}

$copyFolders = Read-Host 'do you wanna copy these folders your about to create in the rest of the folders in the footage folder? (Enter "y" to accept)'

if (!$copyFolders) {
    write-host 'in which folder would you like to add more stuff'

    $getName = Read-Host 'give name please'
}

do {
    $customFolders2 = Read-Host 'add cusotm folder in footage folder folder'
    if ($customFolders2) {
        $customFolderArr2 += $customFolders2
    }
}
until($customFolders2 -eq '')



foreach ($customFolder2 in $customFolderArr2) {
    
    if ($copyFolders) {
        foreach ($customFolder in $customFolderArr) {
            makeFolder -path $rootPath\$rootName\footage\$customFolder -name $customFolder2
        }
        
    }
    else {
        makeFolder -path $rootPath\$rootName\footage\$getName -name $customFolder2
    }
}

copy-item -path $ass\Outro.mp3 -Destination $rootPath\$rootName\music\"$projectName Outro".mp3

Start-Process $rootPath\$rootName
