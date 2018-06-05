::Upload files to FTP site using parameters

@echo off

color 2

set server=%1
set port=%2
set user=%3
set pwd=%4
set remote_folder=%5
set file=%6

echo open %server% %port%>ftpcmd.dat
echo %user%>>ftpcmd.dat
echo %pwd%>>ftpcmd.dat
echo prompt>>ftpcmd.dat
echo cd %remote_folder%>>ftpcmd.dat
echo put C:\temp\%file%>>ftpcmd.dat
echo bye>>ftpcmd.dat

echo "Inicia Carga Archivo de Pagos "
ftp -s:ftpcmd.dat
del ftpcmd.dat
echo " Transferencia Completa "
::pause
exit