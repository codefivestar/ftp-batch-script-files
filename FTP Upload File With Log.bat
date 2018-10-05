::Upload files to FTP site using parameters and log

@echo off

color 2

set server=%1
set port=%2
set user=%3
set pwd=%4
set remote_folder=%5
set file=%6

set yy=%date:~-4%
set mm=%date:~3,2%
 if "%mm:~0,1%" == " " set mm=0%mm:~1,1%
set dd=%date:~0,2%
 if "%dd:~0,1%" == " " set dd=0%dd:~1,1%

echo open %server% %port%>ftpcmd.dat
echo %user%>>ftpcmd.dat
echo %pwd%>>ftpcmd.dat
echo prompt>>ftpcmd.dat
echo cd %remote_folder%>>ftpcmd.dat
echo put C:\temp\%file%>>ftpcmd.dat
::echo dir>>ftpcmd.dat --se utiliza para ver el contenido de la carpeta remota
echo bye>>ftpcmd.dat

echo Inicia Carga Archivo de Pagos : %date% %time%>>transfer_%yy%_%mm%_%dd%.log
echo ------------------------------->>transfer_%yy%_%mm%_%dd%.log
ftp -s:ftpcmd.dat>>transfer_%yy%_%mm%_%dd%.log
del ftpcmd.dat
echo ------------------------------->>transfer_%yy%_%mm%_%dd%.log
echo Transferencia Completa : %date% %time%>>transfer_%yy%_%mm%_%dd%.log

::pause

exit