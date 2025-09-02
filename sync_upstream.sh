#!/bin/bash

# StoryDiffusion 上游同步脚本
# 用于同步原项目 HVision-NKU/StoryDiffusion 的更新

echo "🔄 开始同步上游项目..."

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  检测到未提交的更改，请先提交或暂存更改"
    git status
    exit 1
fi

# 获取上游更新
echo "📥 获取上游项目更新..."
git fetch upstream

# 检查是否有更新
LOCAL_COMMIT=$(git rev-parse HEAD)
UPSTREAM_COMMIT=$(git rev-parse upstream/main)

if [ "$LOCAL_COMMIT" = "$UPSTREAM_COMMIT" ]; then
    echo "✅ 已经是最新版本，无需同步"
    exit 0
fi

echo "🔄 发现上游更新，开始同步..."

# 创建同步分支
SYNC_BRANCH="sync-upstream-$(date +%Y%m%d)"
echo "🌿 创建同步分支: $SYNC_BRANCH"
git checkout -b "$SYNC_BRANCH"

# 合并上游更新
echo "🔀 合并上游更新..."
git merge upstream/main

# 检查是否有冲突
if [ $? -ne 0 ]; then
    echo "⚠️  检测到冲突，请手动解决冲突后继续"
    echo "💡 解决冲突后运行: git add . && git commit -m '解决同步冲突'"
    echo "💡 然后运行: git checkout main && git merge $SYNC_BRANCH"
    exit 1
fi

# 合并到主分支
echo "✅ 同步成功，合并到主分支..."
git checkout main
git merge "$SYNC_BRANCH"

# 清理临时分支
echo "🧹 清理临时分支..."
git branch -d "$SYNC_BRANCH"

echo "🎉 同步完成！"
echo "📝 建议更新 README.md 中的版本信息"
