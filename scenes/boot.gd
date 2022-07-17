extends Node2D

var debugUiScene = preload("res://scenes/debug/debug_ui.tscn")

func _ready():
	Log.log(Log.Level.Info, "boot _ready")
# load debug UI
	var debugUiInstance = debugUiScene.instance()
	get_tree().get_root().call_deferred("add_child", debugUiInstance)
	
func _init():
	Log.log(Log.Level.Info, "boot _init")
	GameRoot.initialise()

	
