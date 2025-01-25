# godotboot
## [中文](README.md)|[English](README_EN.md)
godot框架，基于gdscript，采用ddd的方式分包，包含了一些常用工具集

### 分包逻辑
project file
├── assets/           # 项目资产
│   ├── audio/        # 音频资源
│   │   ├── music/    # 背景音乐
│   │   └── sfx/      # 音效
│   ├── graphics/     # 图形资源
│   │   ├── textures/ # 纹理
│   │   ├── sprites/  # 精灵
│   │   └── fonts/    # 字体
│   ├── models/       # 3D 模型资源
│   ├── localization/ # 本地化
│   └── other/        # 其他杂项资产，如粒子效果配置等
│       ├── docs/     # 文档
│       └── art/      # 艺术设定集等
└── src/              # 项目代码
	├── domain/       # 领域层
	│   ├── entities/ # 实体
	│   ├── value_objects/ # 值对象
	│   ├── aggregates/ # 聚合根
	│   └── services/ # 领域服务
	├── app/          # 应用层：存放应用服务
	├── infrastructure/ # 基础设施层
	│   ├── repositories/ # 仓储实现
	│   ├── persistence/ # 持久化
	│   └── api/ # 外部服务
	├── presentation/ # 表现层
	│   ├── stages/   # 关卡设计
	│   ├── hud/      # 交互界面
	│   ├── ...
	│   └── charactors/  # 角色ui
	└── common/       # 通用能力
		├── constants/ # 常量
		├── global/   # 需要全局加载的管理器类
		└── utils/     # 工具类
		
### 工具集
+ Logger: 日志工具