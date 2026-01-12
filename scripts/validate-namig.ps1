$project = $args[0]

if ($project -notmatch '^[A-Z]{3,}-[A-Z]{3,}-[0-9]{3}$') {
  Write-Error "Naming inválido. Ejemplo válido: APP-CORE-001"
  exit 1
}
