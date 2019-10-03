extends Node
# Enum para cada opção
# Dictionary/Array para cada label de opção
# Fazer signal _value_changed

enum Resolution {RES_800x450, RES_1280x720, RES_1366x768}
enum DisplayMode {WINDOWED, FULLSCREEN, BORDERLESS}
enum AspectRatio {STRETCH, KEEP}
enum Vsync {ON, OFF}

#class ResolutionData: #{RES_800x450, RES_1280x720, RES_1366_768}
#	var width
#	var height
#
#	func toString():
#		return str(width) + "x" + str(height)
#
#var ResolutionLabel = {
#	Resolution.RES_800x450: "800x450", 
#	Resolution.RES_1280x720: "1280x720", 
#	Resolution.RES_1366x768: "1366x768"
#}
#
#var DisplayModeLabel = {
#	DisplayMode.WINDOWED: "Windowed", 
#	DisplayMode.FULLSCREEN: "Fullscreen", 
#	DisplayMode.BORDERLESS: "Borderless"
#}

var _resolution
var _displayMode
var _aspectRatio
var _vsync

var config

func _ready():
	config = ConfigFile.new()
	_resolution = Resolution.RES_800x450
	_displayMode = DisplayMode.WINDOWED
	_aspectRatio = AspectRatio.STRETCH
	_vsync = Vsync.ON
	
func setAspectRatio(index):
	print(index)
	
func setDisplayMode(index):
	print(index)
	
func setResolution(index):
	print(index)

func setVSYNC(index):
	print(index)
	
func apply():
	config.set_value("config", "displayMode", _displayMode)
	config.set_value("config", "aspectRatio", _aspectRatio)
	config.set_value("config", "vsync", _vsync)
