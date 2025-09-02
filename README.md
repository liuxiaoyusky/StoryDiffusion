# StoryDiffusion 🎨

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Gradio](https://img.shields.io/badge/Gradio-5.44.1-orange.svg)](https://gradio.app/)

> 基于 Stable Diffusion XL 的智能故事图像生成系统，支持人物身份保持和故事连续性生成

## 📋 项目说明

**⚠️ 重要说明：** 本项目是基于 [HVision-NKU/StoryDiffusion](https://github.com/HVision-NKU/StoryDiffusion) 的 fork 版本，原项目已于 2024 年停止更新。

### 🔄 主要更新内容

- ✅ **依赖版本兼容性修复** - 更新所有依赖到最新兼容版本
- ✅ **解决版本冲突问题** - 修复 `huggingface_hub`、`diffusers`、`transformers`、`peft`、`accelerate`、`gradio` 等库的版本冲突
- ✅ **现代化依赖管理** - 使用最新的稳定版本，确保长期维护性
- ✅ **跨平台优化** - 支持 macOS、Linux、Windows 等平台

### 📦 依赖版本对比

| 依赖库 | 原版本 | 更新版本 | 状态 |
|--------|--------|----------|------|
| gradio | 4.22.0 | 5.44.1 | ✅ 更新 |
| diffusers | 0.25.0 | 0.35.1 | ✅ 更新 |
| transformers | 4.36.2 | 4.56.0 | ✅ 更新 |
| huggingface-hub | 0.20.2 | 0.34.4 | ✅ 更新 |
| accelerate | - | 1.10.1 | ✅ 新增 |
| peft | - | 0.17.1 | ✅ 新增 |

### 🔄 Fork 与同步说明

本项目是原项目的 fork 版本，具有以下特点：

- **独立开发**: 可以自由修改代码而不影响原项目
- **长期维护**: 当原项目停止更新时，可以继续维护和改进
- **上游同步**: 如果原项目恢复更新，可以通过 `sync_upstream.sh` 脚本同步

#### 同步上游更新（如果原项目恢复更新）

```bash
# 运行同步脚本
./sync_upstream.sh

# 或者手动同步
git fetch upstream
git checkout -b sync-upstream
git merge upstream/main
# 解决冲突后合并到主分支
```

---

## ✨ 特性

- 🎭 **人物身份保持**: 使用 PhotoMaker 技术保持人物特征一致性
- 📖 **故事连续性**: 支持多帧故事图像生成
- 💾 **低显存优化**: 针对低显存设备优化
- 🚀 **多种模型支持**: 支持 SDXL、RealVision、Juggernaut 等模型
- 🖥️ **跨平台支持**: 支持 CUDA、MPS、CPU

## 🚀 快速开始

### 环境要求

- Python 3.8+
- CUDA 11.8+ (推荐) 或 MPS (Apple Silicon)
- 至少 8GB VRAM (推荐 16GB+)

### 安装

```bash
# 克隆仓库
git clone https://github.com/liuxiaoyusky/StoryDiffusion.git
cd StoryDiffusion

# 创建虚拟环境
python -m venv storydiffusion_env

# 激活环境
# Windows
storydiffusion_env\Scripts\activate
# macOS/Linux
source storydiffusion_env/bin/activate

# 安装依赖
pip install -r requirements.txt
```

### 下载模型

在运行前，您需要下载以下模型文件：

```bash
# 创建数据目录
mkdir -p data

# 下载 PhotoMaker 模型 (约 2GB)
# 从 https://huggingface.co/TencentARC/PhotoMaker 下载 photomaker-v1.bin
# 放置到 data/photomaker-v1.bin
```

### 运行应用

```bash
# 启动 Gradio 界面
python gradio_app_sdxl_specific_id_low_vram.py
```

## 📁 文件结构

```
StoryDiffusion/
├── gradio_app_sdxl_specific_id_low_vram.py  # 主应用文件
├── app.py                                   # 简化版应用
├── predict.py                               # 预测接口
├── sync_upstream.sh                         # 上游同步脚本
├── utils/                                   # 工具模块
│   ├── pipeline.py                         # 核心管道
│   ├── gradio_utils.py                     # Gradio 工具
│   ├── load_models_utils.py                # 模型加载工具
│   └── ...
├── config/                                  # 配置文件
│   └── models.yaml                         # 模型配置
├── data/                                    # 模型数据目录
├── examples/                                # 示例图片
├── requirements.txt                         # 依赖列表
└── README.md                               # 说明文档
```

## 🔧 主要功能

### 人物身份保持
- 使用 PhotoMaker 技术
- 支持多张参考图片
- 保持人物特征一致性

### 故事连续性生成
- 支持多帧故事生成
- 自动处理时序关系
- 保持场景连贯性

### 低显存优化
- 针对低显存设备优化
- 支持梯度检查点
- 内存使用优化

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

本项目基于原项目的 Apache-2.0 许可证。

## 🙏 致谢

- 原项目：[HVision-NKU/StoryDiffusion](https://github.com/HVision-NKU/StoryDiffusion)
- 作者：Yupeng Zhou, Daquan Zhou, Ming-Ming Cheng, Jiashi Feng, Qibin Hou
- 论文：[StoryDiffusion: Consistent Self-Attention for Long-Range Image and Video Generation](https://arxiv.org/abs/2403.12003)

## 📞 联系方式

- 原项目：ypzhousdu@gmail.com, zhoudaquan21@gmail.com
- 本 fork：请通过 GitHub Issues 联系

---

**注意：** 本项目仅用于研究和学习目的，请遵守相关法律法规。
