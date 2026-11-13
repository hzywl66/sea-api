@echo off
cd /d "%~dp0"
set "EXE="
for %%f in (sea-api-*.exe) do if not defined EXE set "EXE=%%f"
if not defined EXE (
  echo 没有找到 sea-api-*.exe，请把这个文件和 exe 放在同一个目录。
  pause
  exit /b 1
)
echo 正在自检：%EXE%
echo.
"%EXE%" --selftest
echo.
if errorlevel 1 (
  echo 自检没有通过 —— 把上面的内容整段发出来。
) else (
  echo 自检通过，这个 exe 本身是好的。
)
pause
