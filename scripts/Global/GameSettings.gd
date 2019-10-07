extends Node

enum Resolution {RES_800x450, RES_1280x720, RES_1366x768}
enum DisplayMode {WINDOWED, FULLSCREEN, BORDERLESS}
enum AspectRatio {STRETCH, KEEP}
enum Vsync {ON, OFF}

class ResolutionData: #{RES_800x450, RES_1280x720, RES_1366_768}
	var width
	var height
	
	func _init(w, h):
		width = w
		height = h

	func toString():
		return str(width) + "x" + str(height)

var _resolution
var _displayMode
var _aspectRatio
var _vsync

var resolutionList = [ResolutionData.new(800,450), ResolutionData.new(1280,720), ResolutionData.new(1366,768)]
var currentResolutionData

var config

func _ready():
	loadConfig()
	apply()
	
func setAspectRatio(index):
	print(index)
	_aspectRatio = index
	
func setDisplayMode(index):
	print(index)
	_displayMode = index
	
func setResolution(index):
	print(index)
	_resolution = index
	currentResolutionData = resolutionList[_resolution]

func setVSYNC(index):
	print(index)
	_vsync = index
	
func loadConfig():
	_resolution = Resolution.RES_1366x768
	
	config = ConfigFile.new()
	var err = config.load("config/config.cfg")
	if err == OK:
		_displayMode = config.get_value("config", "displayMode", DisplayMode.WINDOWED)
		_aspectRatio = config.get_value("config", "aspectRatio", AspectRatio.STRETCH)
		_vsync = config.get_value("config", "vsync", Vsync.ON)
		currentResolutionData = ResolutionData.new(config.get_value("config", "width", 1366), config.get_value("config", "height", 768))
	else:
		_displayMode = DisplayMode.WINDOWED
		_aspectRatio = AspectRatio.STRETCH
		_vsync = Vsync.ON
		currentResolutionData = resolutionList[Resolution.RES_1366x768]
	
func applyAndSave():
	config.set_value("config", "displayMode", _displayMode)
	config.set_value("config", "aspectRatio", _aspectRatio)
	config.set_value("config", "vsync", _vsync)
	config.set_value("config", "width", currentResolutionData.width)
	config.set_value("config", "height", currentResolutionData.height)
	print(config.save("config/config.cfg"))
	apply()

func apply():
	#vsync
	OS.vsync_enabled = true if (_vsync == Vsync.ON) else false
	
	# aspect ratio
	var stretchAspect = SceneTree.STRETCH_ASPECT_KEEP if (_aspectRatio == AspectRatio.KEEP) else SceneTree.STRETCH_ASPECT_IGNORE
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, stretchAspect, Vector2(800, 450))
	
	# display mode
	match _displayMode:
		DisplayMode.WINDOWED:
			OS.window_fullscreen = false
			OS.window_borderless = false
		DisplayMode.FULLSCREEN:
			OS.window_fullscreen = true
			OS.window_borderless = false
		DisplayMode.BORDERLESS:
			OS.window_borderless = true
	
	# resolution
	#OS.window_size = Vector2(currentResolutionData.width, currentResolutionData.height)
	get_tree().get_root().set_size_override(true, Vector2(currentResolutionData.width, currentResolutionData.height))