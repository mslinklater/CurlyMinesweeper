extends Node

enum Level { Verbose = 0, Info = 1, Warning = 2, Error = 3, Fatal = 4 }

var currentLogLevel = Level.Verbose

func log(level, message: String):
	if level >= currentLogLevel:
		print(message)	
