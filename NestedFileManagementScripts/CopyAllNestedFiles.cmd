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

:: Ініціалізація лічильника скопійованих файлів
set /a "file_count=0"

:: Рекурсивне копіювання файлів та підрахунок
for /R "%source_folder%" %%f in (*) do (
    copy "%%f" "%destination_folder%" >nul
    if %errorlevel% equ 0 set /a "file_count+=1"
)

:: Виведення загальної кількості скопійованих файлів
echo All files have been copied successfully.
echo Total files copied: %file_count%
pause
