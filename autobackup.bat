@echo off
cd "C:\Program Files (x86)\Steam\userdata"
start /min (
  git add .
  set time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
  set time=%time: =0%

  set date=%DATE:~0,2%/%DATE:~3,2%/%DATE:~6,4%
  set date=%date: =0%

  git commit -am "Regular auto-commit at %time% on %date%"
  git push origin master
)