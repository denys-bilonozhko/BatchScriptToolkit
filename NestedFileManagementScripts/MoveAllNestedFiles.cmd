@echo off
setlocal

:: Вказати шлях до вихідної папки
set "source_folder=%~dp0source"

:: Вказати шлях до цільової папки
set "destination_folder=%~dp0destination"

:: Створення цільової папки, якщо вона не існує
if not exist "%destination_folder%" (
    mkdir "%destination_folder%"
)

:: Ініціалізація лічильника перенесених файлів
set /a "file_count=0"

:: Рекурсивне переміщення файлів
for /R "%source_folder%" %%f in (*) do (
    move "%%f" "%destination_folder%"
	if %errorlevel% equ 0 set /a "file_count+=1"
)

:: Кінець скрипта
echo All files have been moved successfully.
echo Total files moved: %file_count%
pause