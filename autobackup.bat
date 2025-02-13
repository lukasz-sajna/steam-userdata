@echo off
cd "C:\Program Files (x86)\Steam\userdata"
cmd /c (
  git add .

  :: Pobranie poprawnego formatu godziny
  set time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
  set time=%time: =0%

  :: Pobranie poprawnego formatu daty dla polskiego systemu
  set date=%DATE:~4,2%/%DATE:~1,2%/%DATE:~7,4%

  git commit -am "Regular auto-commit at %time% on %date%"
  git push origin master
)
