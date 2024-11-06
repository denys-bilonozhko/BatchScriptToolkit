@echo off
setlocal

:: Вказати шлях до папки, де буде створена тестова структура
set "test_folder=%~dp0source"

:: Створити основну папку, якщо вона не існує
if not exist "%test_folder%" (
    mkdir "%test_folder%"
)

:: Максимальна вкладеність
set "max_depth=10"

:: Створити вкладені папки та файли всередині них
call :create_files "%test_folder%" 1

echo Test folders and files created successfully.
pause
exit /b

:create_files
set "current_folder=%~1"
set /a "current_depth=%~2"

:: Створення файлу у поточній папці
echo This is a test file at depth %current_depth% > "%current_folder%\test_file_%current_depth%.txt"

:: Перевірка на досягнення максимальної вкладеності
if %current_depth% geq %max_depth% exit /b

:: Створити нову вкладену папку і викликати функцію для створення файлів всередині
set /a "next_depth=%current_depth% + 1"
set "next_folder=%current_folder%\folder_%next_depth%"
mkdir "%next_folder%"

call :create_files "%next_folder%" %next_depth%
exit /b
