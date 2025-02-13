@echo off
cd "C:\Program Files (x86)\Steam\userdata"
cmd /c (
  git add .

  :: Pobranie poprawnego formatu godziny
  set time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
  set time=%time: =0%

  :: Pobranie poprawnego formatu daty
  for /f %%I in ('wmic os get localdatetime ^| find "."') do set datetime=%%I
  set date=%datetime:~6,2%/%datetime:~4,2%/%datetime:~0,4%

  git commit -am "Regular auto-commit at %time% on %date%"
  git push origin master
)
