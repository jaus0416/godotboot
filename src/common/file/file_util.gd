## 文件相关工具
class_name FileUtil extends Node

# 用户数据前缀
const SAVE_PATH_PREFIX = "user://"

# 文件存储类型
enum FILE_STORE_TYPE {
	CONFIG, # 配置相关存储，通常直接用 ConfigFile 存储，不需要走此类
	USER_DATA, # 用户数据
	COMMON # 通用存储
}
