$org = "https://dev.azure.com/TU_ORG"
$token = "$(System.AccessToken)"

$project = $args[0]
$desc = $args[1]

$body = @{
 name = $project
 description = $desc
 capabilities = @{
  versioncontrol = @{ sourceControlType = "Git" }
  processTemplate = @{ templateTypeId = "adcc42ab-9882-485e-a3ed-7678f01f66bc" }
 }
} | ConvertTo-Json -Depth 10

$auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))

Invoke-RestMethod -Method POST `
 -Uri "$org/_apis/projects?api-version=7.1-preview.4" `
 -Headers @{ Authorization = "Basic $auth" } `
 -ContentType "application/json" `
 -Body $body
