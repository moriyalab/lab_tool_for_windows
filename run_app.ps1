# ZIPファイルのURLと保存先
$zipUrl = "https://github.com/moriyalab/lab_tool/archive/refs/heads/main.zip"
$zipPath = "$PWD\lab_tool.zip"
$extractPath = "$PWD\lab_tool-main"

# ZIPファイルのダウンロード
Write-Host "Downloading ZIP file..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# ZIPファイルの展開
Write-Host "Extracting ZIP file..."
Expand-Archive -Path $zipPath -DestinationPath $PWD -Force

# ZIPファイルを削除（必要に応じて削除しない場合はコメントアウト）
Remove-Item $zipPath

# app.py の存在確認
if (Test-Path "$extractPath\app.py") {
    Write-Host "Running app.py..."
    ./python.exe "$extractPath\app.py"
} else {
    Write-Host "Error: app.py not found in the extracted folder."
}

# 実行後、ウィンドウが閉じないように停止
Write-Host "Done. Press any key to exit..."
[System.Console]::ReadKey()
