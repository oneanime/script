@echo off
set servername="MySQL"
sc query|find %servername% && net stop %servername%  || net start %servername%