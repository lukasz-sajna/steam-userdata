@echo off
cd "C:\Program Files (x86)\Steam\userdata"
cmd /c (
  git add .

  :: Pobranie poprawnego formatu godziny
  set time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
  set time=%time: =0%

  :: Pobranie poprawnego formatu daty z PowerShell
  for /f %%I in ('powershell -Command "Get-Date -Format \"dd/MM/yyyy\""' ) do set date=%%I

  git commit -am "Regular auto-commit at %time% on %date%"
  git push origin master
)
