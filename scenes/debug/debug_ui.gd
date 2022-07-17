extends Control

onready var _difficultyLabel = $UIRoot/DifficultyLabel
onready var _levelLabel = $UIRoot/LevelLabel

func _ready():
	refresh()

func refresh():
	_levelLabel.text = String(GameConfig.levelNum)
	match GameConfig.difficulty:
		GameConfig.Difficulty.Easy:
			_difficultyLabel.text = "Easy"
		GameConfig.Difficulty.Medium:
			_difficultyLabel.text = "Medium"
		GameConfig.Difficulty.Hard:
			_difficultyLabel.text = "Hard"
		GameConfig.Difficulty.Extreme:
			_difficultyLabel.text = "Extreme"

func _on_Button_toggle_pressed():
	# Toggle the debug UI
	$UIRoot.visible = !$UIRoot.visible

func _on_DifficultyUpButton_pressed():
	GameConfig.difficulty = clamp(GameConfig.difficulty + 1, GameConfig.Difficulty.Easy, GameConfig.Difficulty.Extreme)	
	refresh()

func _on_DifficultyDownButton_pressed():
	GameConfig.difficulty = clamp(GameConfig.difficulty - 1, GameConfig.Difficulty.Easy, GameConfig.Difficulty.Extreme)	
	refresh()

func _on_LevelUpButton_pressed():
	GameConfig.levelNum = int(clamp(GameConfig.levelNum+1, 1, GameConfig.numLevelsPerDifficulty))
	refresh()

func _on_LevelDownButton_pressed():
	GameConfig.levelNum = int(clamp(GameConfig.levelNum-1, 1, GameConfig.numLevelsPerDifficulty))
	refresh()

func _on_GoButton_pressed():
	$UIRoot.visible = false
	GameRoot.startGameplay()

func _on_BootButton_pressed():
	pass # Do the proper full boot sequence...
