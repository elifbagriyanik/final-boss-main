$rootPath = "c:\\Users\\bagri\\OneDrive\\Desktop\\dizi-anime-test-sitesi-main"
$files = Get-ChildItem -Path $rootPath -Recurse -Filter *.html

foreach ($file in $files) {
    try {
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        # Regex to remove lines containing the specific anchor tags, including their whitespace
        # (?m) enables multiline mode ^...$ matches lines
        
        # Navbar matching
        $content = $content -replace '(?m)^\s*<a href="#" class="btn-kapsul btn-giris">Giriş Yap</a>\r?\n?', ''
        $content = $content -replace '(?m)^\s*<a href="#" class="btn-kapsul btn-kayit">Kayıt Ol</a>\r?\n?', ''
        
        # Side Menu matching
        $content = $content -replace '(?m)^\s*<a href="#">👤 Giriş Yap</a>\r?\n?', ''
        $content = $content -replace '(?m)^\s*<a href="#">📝 Kayıt Ol</a>\r?\n?', ''
        
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Success: $($file.Name)"
    }
    catch {
        Write-Host "Error processing $($file.Name): $_"
    }
}
