extends Node

var gameplayScene: PackedScene
var mapsEasy = {}
var mapsMedium = {}
var mapsHard = {}
var mapsExtreme = {}

func _ready():
	Log.log(Log.Level.Verbose, "GameRoot _ready")
	gameplayScene = load("res://scenes/gameplay.tscn")
	mapsEasy = loadFile("res://json/maps_easy.tres")	
	mapsMedium = loadFile("res://json/maps_medium.tres")	
	mapsHard = loadFile("res://json/maps_hard.tres")	
	mapsExtreme = loadFile("res://json/maps_extreme.tres")	
	
func loadFile(filename):
	var thefile = File.new()
	thefile.open(filename, File.READ)
	var dict = parse_json(thefile.get_as_text())
	thefile.close()
	return dict
	
func initialise():
	Log.log(Log.Level.Verbose, "GameRoot initialise")
	GameConfig.difficulty = GameConfig.Difficulty.Easy
	GameConfig.levelNum = 1

func startGameplay():
	var gameplaySceneInstance = gameplayScene.instance()
	get_tree().get_root().add_child(gameplaySceneInstance)
	
