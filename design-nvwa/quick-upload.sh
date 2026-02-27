#!/bin/bash

# Design Nvwa - 快速上传到 GitHub 脚本

set -e  # 遇到错误立即退出

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 变量设置
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
TEMP_DIR="$PROJECT_DIR/temp-myskills"
GITHUB_REPO="git@github.com:niu1147713149-png/myskills.git"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Design Nvwa - 快速上传到 GitHub${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

echo -e "📁 当前目录: ${SCRIPT_DIR}"
echo -e "📦 项目目录: ${PROJECT_DIR}"
echo ""

# [1/5] 克隆仓库
echo -e "${YELLOW}[1/5] 克隆仓库...${NC}"
cd "$PROJECT_DIR"

if [ -d "$TEMP_DIR" ]; then
    echo -e "${YELLOW}⚠️  临时目录已存在，正在删除...${NC}"
    rm -rf "$TEMP_DIR"
fi

if git clone "$GITHUB_REPO" temp-myskills; then
    echo -e "${GREEN}✅ 克隆成功${NC}"
else
    echo -e "${RED}❌ 克隆失败！请检查：${NC}"
    echo "   - 网络连接是否正常"
    echo "   - GitHub 仓库是否存在"
    echo "   - 是否有访问权限"
    exit 1
fi
echo ""

# [2/5] 准备目录
echo -e "${YELLOW}[2/5] 准备文件...${NC}"
cd "$TEMP_DIR"
mkdir -p design-nvwa
echo ""

# [3/5] 复制文件
echo -e "${YELLOW}[3/5] 复制文件...${NC}"
cp "$SCRIPT_DIR/SKILL.md" design-nvwa/
cp "$SCRIPT_DIR/README.md" design-nvwa/
cp "$SCRIPT_DIR/UPLOAD_GUIDE.md" design-nvwa/
cp "$SCRIPT_DIR/quick-upload.sh" design-nvwa/
cp "$SCRIPT_DIR/quick-upload.bat" design-nvwa/
chmod +x design-nvwa/quick-upload.sh

echo -e "${GREEN}✅ 文件复制完成${NC}"
echo ""

# [4/5] 提交更改
echo -e "${YELLOW}[4/5] 提交更改...${NC}"
git add design-nvwa/

if git diff --cached --quiet; then
    echo -e "${BLUE}ℹ️  没有新的更改需要提交${NC}"
else
    git commit -m "Add/Update design-nvwa skill: 智能设计路由系统

- 支持三条设计路线（纯创意/纯参考/创意+规范）
- 智能需求采集和路线判断
- 完整的使用文档和示例
- 提供 Windows 和 Unix 上传脚本"
    echo -e "${GREEN}✅ 提交成功${NC}"
fi
echo ""

# [5/5] 推送到 GitHub
echo -e "${YELLOW}[5/5] 推送到 GitHub...${NC}"
if git push origin main; then
    echo -e "${GREEN}✅ 推送成功${NC}"
else
    echo -e "${RED}❌ 推送失败！可能的原因：${NC}"
    echo "   - 需要身份验证（使用 Personal Access Token）"
    echo "   - 没有推送权限"
    echo "   - 网络连接问题"
    echo ""
    echo -e "${BLUE}💡 提示：如果需要输入密码，请使用 GitHub Personal Access Token${NC}"
    echo "   获取 Token：https://github.com/settings/tokens"
    cd "$PROJECT_DIR"
    rm -rf "$TEMP_DIR"
    exit 1
fi
echo ""

# 清理
echo -e "${YELLOW}[清理] 删除临时文件...${NC}"
cd "$PROJECT_DIR"
rm -rf "$TEMP_DIR"
echo -e "${GREEN}✅ 清理完成${NC}"
echo ""

# 完成
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✨ 上传成功！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}🔗 查看仓库：${NC}"
echo "https://github.com/niu1147713149-png/myskills/tree/main/design-nvwa"
echo ""
echo -e "${BLUE}📦 其他人可以使用以下命令安装：${NC}"
echo "npx skills add https://github.com/niu1147713149-png/myskills --skill design-nvwa"
echo ""
