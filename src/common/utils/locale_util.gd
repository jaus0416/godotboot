class_name LocaleUtil extends Node

const LANGUAGE_MAP = {
	# 通用中文代码，代表中文
	"zh": "中文",
	# 表示简体中文的代码
	"zh-Hans": "简体中文",
	# 表示繁体中文的代码
	"zh-Hant": "繁体中文",
	# 适用于台湾地区的繁体中文代码
	"zh-TW": "繁体中文（台湾）",
	# 适用于香港地区的繁体中文代码
	"zh-HK": "繁体中文（香港）",
	# 通用英文代码，代表英语
	"en": "English",
	# 美国英语代码
	"en-US": "English (United States)",
	# 英国英语代码
	"en-GB": "English (United Kingdom)",
	# 日语代码
	"ja": "日本語",
	# 韩语代码
	"ko": "한국어",
	# 通用法语代码
	"fr": "Français",
	# 法国地区的法语代码
	"fr-FR": "Français (France)",
	# 德语代码
	"de": "Deutsch",
	# 通用西班牙语代码
	"es": "Español",
	# 西班牙地区的西班牙语代码
	"es-ES": "Español (España)",
	# 墨西哥地区的西班牙语代码
	"es-MX": "Español (México)",
	# 意大利语代码
	"it": "Italiano",
	# 通用葡萄牙语代码
	"pt": "Português",
	# 巴西地区的葡萄牙语代码
	"pt-BR": "Português (Brasil)",
	# 俄语代码
	"ru": "Русский",
	# 阿拉伯语代码
	"ar": "العربية",
	# 印地语代码
	"hi": "हिन्दी"
}

# 获取默认地区配置
static func get_default_locale() -> String:
	# 检查系统语言
	var _system_locale = OS.get_locale_language()
	if _system_locale != null and TranslationServer.get_loaded_locales().has(_system_locale):
		return _system_locale
	# 使用默认语言
	return ProjectSettings.get_setting("internationalization/locale/fallback")
