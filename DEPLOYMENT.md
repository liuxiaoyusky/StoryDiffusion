# StoryDiffusion - 智能故事图像生成系统

## 项目简介

StoryDiffusion 是一个基于 Stable Diffusion XL 的智能故事图像生成系统，支持人物身份保持和故事连续性生成。

**⚠️ 重要说明：** 本项目是基于 [HVision-NKU/StoryDiffusion](https://github.com/HVision-NKU/StoryDiffusion) 的 fork 版本，原项目已于 2024 年停止更新。本版本已修复所有依赖版本兼容性问题，确保在现代环境中正常运行。

### 🔄 主要更新内容

- ✅ **依赖版本兼容性修复** - 更新所有依赖到最新兼容版本
- ✅ **解决版本冲突问题** - 修复 `huggingface_hub`、`diffusers`、`transformers`、`peft`、`accelerate`、`gradio` 等库的版本冲突
- ✅ **现代化依赖管理** - 使用最新的稳定版本，确保长期维护性
- ✅ **跨平台优化** - 支持 macOS、Linux、Windows 等平台

## 环境要求

- Python 3.8+
- CUDA 11.8+ (推荐) 或 MPS (Apple Silicon)
- 至少 8GB VRAM (推荐 16GB+)

## 快速开始

### 1. 环境设置

```bash
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

### 2. 下载必要模型

在运行前，您需要下载以下模型文件：

```bash
# 创建数据目录
mkdir -p data

# 下载 PhotoMaker 模型 (约 2GB)
# 从 https://huggingface.co/TencentARC/PhotoMaker 下载 photomaker-v1.bin
# 放置到 data/photomaker-v1.bin
```

### 3. 运行应用

```bash
# 启动 Gradio 界面
python gradio_app_sdxl_specific_id_low_vram.py
```

## 主要功能

- **人物身份保持**: 使用 PhotoMaker 技术保持人物特征一致性
- **故事连续性**: 支持多帧故事图像生成
- **低显存优化**: 针对低显存设备优化
- **多种模型支持**: 支持 SDXL、RealVision、Juggernaut 等模型

## 文件结构

```
StoryDiffusion/
├── gradio_app_sdxl_specific_id_low_vram.py  # 主应用文件
├── app.py                                   # 简化版应用
├── predict.py                               # 预测接口
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

## 依赖版本信息

### 核心依赖
- **gradio**: 5.44.1 (原 4.22.0)
- **diffusers**: 0.35.1 (原 0.25.0)
- **transformers**: 4.56.0 (原 4.36.2)
- **huggingface-hub**: 0.34.4 (原 0.20.2)
- **accelerate**: 1.10.1 (新增)
- **peft**: 0.17.1 (新增)

### 其他依赖
- **torch**: 2.8.0
- **torchvision**: 0.23.0
- **xformers**: 0.0.20
- **safetensors**: 0.6.2
- **omegaconf**: 2.3.0
- **numpy**: 1.26.4

## 故障排除

### 常见问题

1. **依赖版本冲突**: 确保使用 `requirements.txt` 中的精确版本
2. **显存不足**: 使用低显存模式或减少批处理大小
3. **模型下载失败**: 检查网络连接，使用镜像源
4. **CUDA 错误**: 确保 CUDA 版本与 PyTorch 兼容

### 性能优化

- 使用 SSD 存储模型文件
- 启用 CUDA 优化
- 调整批处理大小
- 使用梯度检查点节省显存

## 许可证

本项目基于原项目的 Apache-2.0 许可证。

## 致谢

- 原项目：[HVision-NKU/StoryDiffusion](https://github.com/HVision-NKU/StoryDiffusion)
- 作者：Yupeng Zhou, Daquan Zhou, Ming-Ming Cheng, Jiashi Feng, Qibin Hou
- 论文：[StoryDiffusion: Consistent Self-Attention for Long-Range Image and Video Generation](https://arxiv.org/abs/2403.12003)

## 联系方式

- 原项目：ypzhousdu@gmail.com, zhoudaquan21@gmail.com
- 本 fork：请通过 GitHub Issues 联系
