@echo off
set DB_USER=root
set DB_NAME=fashion_store
set DB_HOST=127.0.0.1
set DB_PORT=3308
set DB_PASSWORD=Diep2105@

:: Kiểm tra kết nối MySQL
echo Checking MySQL connection...
:check_mysql
mysqladmin -h %DB_HOST% -P %DB_PORT% -u %DB_USER% -p%DB_PASSWORD% ping >nul 2>&1
if %errorlevel% neq 0 (
    echo Waiting for MySQL to be ready...
    timeout /t 5 >nul
    goto check_mysql
)
echo MySQL is ready!

:: Chạy file initial.sql trước
echo Running initial.sql...
mysql -h %DB_HOST% -P %DB_PORT% -u %DB_USER% -p%DB_PASSWORD% < sql\initial.sql

:: Chạy các file trong thư mục schema theo thứ tự
echo Running schema files...
for /f "tokens=* delims=" %%F in ('dir /b /on sql\schema\*.sql') do (
    echo Running sql\schema\%%F...
    mysql -h %DB_HOST% -P %DB_PORT% -u %DB_USER% -p%DB_PASSWORD% %DB_NAME% < "sql\schema\%%F"
)

:: Chạy các file trong thư mục data nếu có
echo Running data files...
for /f "tokens=* delims=" %%F in ('dir /b /on sql\data\*.sql') do (
    echo Running sql\data\%%F...
    mysql -h %DB_HOST% -P %DB_PORT% -u %DB_USER% -p%DB_PASSWORD% %DB_NAME% < "sql\data\%%F"
)

:: Chạy các file trong thư mục procedures nếu có
echo Running procedure files...
for /f "tokens=* delims=" %%F in ('dir /b /on sql\procedures\*.sql') do (
    echo Running sql\procedures\%%F...
    mysql -h %DB_HOST% -P %DB_PORT% -u %DB_USER% -p%DB_PASSWORD% %DB_NAME% < "sql\procedures\%%F"
)

echo All SQL files executed successfully!
pause
