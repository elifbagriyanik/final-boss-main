$files = Get-ChildItem "c:\Users\bagri\OneDrive\Desktop\dizi-anime-test-sitesi-main" -Recurse -Filter *.html

foreach ($file in $files) {
    if ($file.Name -eq "index.html") { continue }
    
    (Get-Content $file.FullName) | ForEach-Object {
        $_ -replace '<a href="#" class="btn-kapsul btn-giris">Giriş Yap</a>', '' `
           -replace '<a href="#" class="btn-kapsul btn-kayit">Kayıt Ol</a>', '' `
           -replace '<a href="#">👤 Giriş Yap</a>', '' `
           -replace '<a href="#">📝 Kayıt Ol</a>', ''
    } | Set-Content $file.FullName
    
    Write-Host "Processed $($file.Name)"
}
