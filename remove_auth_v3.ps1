$rootPath = "c:\Users\bagri\OneDrive\Desktop\dizi-anime-test-sitesi-main"
$files = Get-ChildItem -Path $rootPath -Recurse -Filter *.html

foreach ($file in $files) {
    # Read as array of lines
    $lines = Get-Content -Path $file.FullName -Encoding UTF8
    $newLines = @()
    
    foreach ($line in $lines) {
        $trimLine = $line.Trim()
        
        # Check for specific lines to SKIP
        
        # Navbar buttons
        if ($trimLine -eq '<a href="#" class="btn-kapsul btn-giris">Giriş Yap</a>') { continue }
        if ($trimLine -eq '<a href="#" class="btn-kapsul btn-kayit">Kayıt Ol</a>') { continue }
        
        # Side Menu buttons
        if ($trimLine -eq '<a href="#">👤 Giriş Yap</a>') { continue }
        if ($trimLine -eq '<a href="#">📝 Kayıt Ol</a>') { continue }
        
        # Add line if it wasn't skipped
        $newLines += $line
    }
    
    Set-Content -Path $file.FullName -Value $newLines -Encoding UTF8
    Write-Host "Processed $($file.Name)"
}
