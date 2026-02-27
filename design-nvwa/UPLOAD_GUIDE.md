# Design Nvwa - GitHub 上传指南

## 准备工作

在上传到 GitHub 之前，请确保：
- ✅ 已安装 Git
- ✅ 已配置 GitHub 账号
- ✅ 有 https://github.com/niu1147713149-png/myskills 仓库的写入权限

## 上传步骤

### 方法 1：直接上传到现有仓库（推荐）

如果 `myskills` 仓库已经存在，使用以下步骤：

#### 1. 克隆仓库

```bash
cd "E:\windows claude\project"
git clone git@github.com:niu1147713149-png/myskills.git temp-myskills
cd temp-myskills
```

#### 2. 复制 design-nvwa 文件夹

```bash
# 创建目标目录（如果不存在）
mkdir -p design-nvwa

# 复制所有文件
cp "../.claude/skills/design-nvwa/SKILL.md" design-nvwa/
cp "../.claude/skills/design-nvwa/README.md" design-nvwa/
cp "../.claude/skills/design-nvwa/UPLOAD_GUIDE.md" design-nvwa/
```

#### 3. 提交并推送

```bash
# 添加文件
git add design-nvwa/

# 提交
git commit -m "Add design-nvwa skill: 智能设计路由系统

- 支持三条设计路线（纯创意/纯参考/创意+规范）
- 智能需求采集和路线判断
- 完整的使用文档和示例"

# 推送到 GitHub
git push origin main
```

#### 4. 清理临时文件

```bash
cd ..
rm -rf temp-myskills
```

### 方法 2：首次创建仓库

如果 `myskills` 仓库还不存在：

#### 1. 在 GitHub 上创建仓库

1. 访问 https://github.com/new
2. 仓库名称：`myskills`
3. 描述：`My custom Claude Code skills`
4. 选择 Public 或 Private
5. 不要初始化 README
6. 点击 "Create repository"

#### 2. 本地初始化并上传

```bash
cd "E:\windows claude\project"

# 创建临时目录
mkdir temp-myskills
cd temp-myskills

# 初始化 Git
git init

# 创建 README
echo "# My Skills" > README.md
echo "" >> README.md
echo "This repository contains my custom Claude Code skills." >> README.md

# 复制 design-nvwa
mkdir design-nvwa
cp "../.claude/skills/design-nvwa/"* design-nvwa/

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Add design-nvwa skill"

# 添加远程仓库
git remote add origin git@github.com:niu1147713149-png/myskills.git

# 推送
git branch -M main
git push -u origin main
```

#### 3. 清理

```bash
cd ..
rm -rf temp-myskills
```

### 方法 3：使用 GitHub Desktop（图形界面）

1. 打开 GitHub Desktop
2. File → Add Local Repository
3. 选择 `E:\windows claude\project\.claude\skills\design-nvwa`
4. 如果提示"不是 Git 仓库"，选择 "Create a repository"
5. Publish repository 到你的 GitHub 账号
6. 仓库名称改为 `myskills`

### 方法 4：使用 GitHub 网页上传（最简单）

1. 访问 https://github.com/niu1147713149-png/myskills
2. 点击 "Add file" → "Upload files"
3. 将 `E:\windows claude\project\.claude\skills\design-nvwa` 文件夹中的所有文件拖入
4. 在文件路径中添加 `design-nvwa/` 前缀
5. 添加提交信息：`Add design-nvwa skill`
6. 点击 "Commit changes"

## 验证上传

上传成功后，访问以下 URL 确认文件已正确上传：

```
https://github.com/niu1147713149-png/myskills/tree/main/design-nvwa
```

你应该能看到：
- SKILL.md
- README.md
- UPLOAD_GUIDE.md

## 安装已上传的 Skill

上传到 GitHub 后，其他人可以使用以下命令安装：

```bash
npx skills add https://github.com/niu1147713149-png/myskills --skill design-nvwa
```

或者手动安装：

```bash
git clone https://github.com/niu1147713149-png/myskills.git
cp -r myskills/design-nvwa /your/project/.claude/skills/
```

## 更新 Skill

如果需要更新 GitHub 上的 skill：

```bash
cd "E:\windows claude\project"
git clone git@github.com:niu1147713149-png/myskills.git temp-myskills
cd temp-myskills

# 更新文件
cp "../.claude/skills/design-nvwa/"* design-nvwa/

# 提交更新
git add design-nvwa/
git commit -m "Update design-nvwa skill: [描述你的更新]"
git push origin main

# 清理
cd ..
rm -rf temp-myskills
```

## 常见问题

### Q: 提示 "Permission denied"
A: 检查 GitHub 账号权限，可能需要：
```bash
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
```

### Q: 推送时要求输入密码
A: GitHub 已不支持密码认证，需要使用 Personal Access Token：
1. 访问 https://github.com/settings/tokens
2. Generate new token (classic)
3. 选择 `repo` 权限
4. 复制 token
5. 推送时使用 token 作为密码

### Q: 如何设置 SSH 密钥
A:
```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "your_email@example.com"

# 复制公钥
cat ~/.ssh/id_ed25519.pub

# 在 GitHub 添加 SSH key
# 访问 https://github.com/settings/keys
```

然后使用 SSH URL：
```bash
git remote set-url origin git@github.com:niu1147713149-png/myskills.git
```

## 完成后

上传成功后，你可以：
1. 在 GitHub 仓库中查看文件
2. 编辑 README 添加更多说明
3. 创建 Release 版本
4. 分享给其他人使用

---

**需要帮助？** 在仓库中创建 Issue：https://github.com/niu1147713149-png/myskills/issues
