# godotboot
## [中文](README.md)|[English](README_EN.md)
Godot framework, based on gdscript, uses the DDD (Domain - Driven Design) approach for sub, packaging and includes some common toolkits.
  
### Project File Structure
  
project file  
├── assets/ # Project assets  
│ ├── audio/ # Audio resources  
│ │ ├── music/ # Background music  
│ │ └── sfx/ # Sound effects  
│ ├── graphics/ # Graphic resources  
│ │ ├── textures/ # Textures  
│ │ ├── sprites/ # Sprites  
│ │ └── fonts/ # Fonts  
│ ├── models/ # 3D model resources  
│ ├── localization/ # Localization  
│ └── other/ # Other miscellaneous assets, such as particle effect configurations  
│ 		├── docs/ # Documents  
│ 		└── art/ # Art sets, etc.  
└── src/ # Project code  
	├── domain/ # Domain layer  
	│ ├── entities/ # Entities  
	│ ├── value_objects/ # Value objects  
	│ ├── aggregates/ # Aggregate roots  
	│ └── services/ # Domain services  
	├── app/ # Application layer: Application services are stored here  
	├── infrastructure/ # Infrastructure layer  
	│ ├── repositories/ # Repository implementations  
	│ ├── persistence/ # Persistence  
	│ └── api/ # External services  
	├── presentation/ # Presentation layer  
	│ ├── stages/ # Level design  
	│ ├── hud/ # Interactive interface  
	│ ├──...  
	│ └── characters/ # Character UI  
	└── common/ # General capabilities  
		├── constants/ # Constants  
		├── global/ # Manager classes that need to be loaded globally  
		└── utils/ # Utility classes
  
### utils
+ Logger: A logging tool
+ SystemSetting: For system setting
+ GameStateMachine: System state machine
