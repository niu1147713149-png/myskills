@echo off
chcp 65001 >nul
echo ========================================
echo Design Nvwa - 快速上传到 GitHub
echo ========================================
echo.

REM 设置变量
set "SOURCE_DIR=%~dp0"
set "PROJECT_DIR=%SOURCE_DIR%..\..\..\"
set "TEMP_DIR=%PROJECT_DIR%temp-myskills"
set "GITHUB_REPO=git@github.com:niu1147713149-png/myskills.git"

echo 📁 当前目录: %SOURCE_DIR%
echo 📦 项目目录: %PROJECT_DIR%
echo.

echo [1/5] 克隆仓库...
cd /d "%PROJECT_DIR%"
if exist "%TEMP_DIR%" (
    echo ⚠️  临时目录已存在，正在删除...
    rmdir /s /q "%TEMP_DIR%"
)

git clone %GITHUB_REPO% temp-myskills
if errorlevel 1 (
    echo ❌ 克隆失败！请检查：
    echo    - 网络连接是否正常
    echo    - GitHub 仓库是否存在
    echo    - 是否有访问权限
    pause
    exit /b 1
)

echo ✅ 克隆成功
echo.

echo [2/5] 准备文件...
cd /d "%TEMP_DIR%"

if not exist "design-nvwa" mkdir design-nvwa

echo.

echo [3/5] 复制文件...
copy "%SOURCE_DIR%SKILL.md" design-nvwa\ >nul
copy "%SOURCE_DIR%README.md" design-nvwa\ >nul
copy "%SOURCE_DIR%UPLOAD_GUIDE.md" design-nvwa\ >nul
copy "%SOURCE_DIR%quick-upload.bat" design-nvwa\ >nul

echo ✅ 文件复制完成
echo.

echo [4/5] 提交更改...
git add design-nvwa/

git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Add/Update design-nvwa skill: 智能设计路由系统"
    echo ✅ 提交成功
) else (
    echo ℹ️  没有新的更改需要提交
)
echo.

echo [5/5] 推送到 GitHub...
git push origin main
if errorlevel 1 (
    echo ❌ 推送失败！可能的原因：
    echo    - 需要身份验证（使用 Personal Access Token）
    echo    - 没有推送权限
    echo    - 网络连接问题
    echo.
    echo 💡 提示：如果需要输入密码，请使用 GitHub Personal Access Token
    echo    获取 Token：https://github.com/settings/tokens
    pause
    cd /d "%PROJECT_DIR%"
    rmdir /s /q "%TEMP_DIR%"
    exit /b 1
)

echo ✅ 推送成功
echo.

echo [清理] 删除临时文件...
cd /d "%PROJECT_DIR%"
rmdir /s /q "%TEMP_DIR%"
echo ✅ 清理完成
echo.

echo ========================================
echo ✨ 上传成功！
echo ========================================
echo.
echo 🔗 查看仓库：
echo https://github.com/niu1147713149-png/myskills/tree/main/design-nvwa
echo.
echo 📦 其他人可以使用以下命令安装：
echo npx skills add https://github.com/niu1147713149-png/myskills --skill design-nvwa
echo.
pause
