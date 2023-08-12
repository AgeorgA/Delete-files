# Блок констант
# Сделал без удаления папок (подумать далее, как можно сделать еще и удаление папок)
# Количество дней со дня создания файла
$Days = "0"
# Целевая папка
$DirToDelete = "C:\testdir\"
# Расширение удаляемых файлов
$Extension = "*.*"

$Today = Get-Date
$LastWrite = $Today.AddDays(-$Days)

$Files = Get-Childitem $DirToDelete -Include $Extension -Recurse | Where{$_.CreationTime -le "$LastWrite" -and $_.LastWriteTime -le "$LastWrite"} | Sort-Object -Descending {$_.FullName.Split('\').Count},FullName
foreach ($File in $Files)
{
 if ($File -ne $NULL -and !$File.PSIsContainer)
 {
  write-host "Deleting file $File" -ForegroundColor "DarkGray"
  Remove-Item $File.FullName -Force | out-null
 }
 }
