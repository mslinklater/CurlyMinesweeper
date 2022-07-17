extends Node

var gameplayScene: PackedScene

func _ready():
	Log.log(Log.Level.Verbose, "GameRoot _ready")
	gameplayScene = load("res://scenes/gameplay.tscn")
	
func initialise():
	Log.log(Log.Level.Verbose, "GameRoot initialise")
	GameConfig.difficulty = GameConfig.Difficulty.Easy
	GameConfig.levelNum = 1

func startGameplay():
	var gameplaySceneInstance = gameplayScene.instance()
	get_tree().get_root().add_child(gameplaySceneInstance)
	
