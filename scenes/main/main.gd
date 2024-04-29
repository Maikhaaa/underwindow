extends Node

const RAD_60 = 1.0472 #An offset of which we rotate windows

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer # Reference to node that plays music
@onready var timer: Timer = $Timer #Sequence timer

var is_spinning: bool = false #This tells the program to rapidly spin or not (false = not, true = yes)

var time: float = 0.0 #Spinning animation time
var speed: float = 0.001 #Speed of which windows spin

#--------------------------------------------------------------------------------------------------#

func _ready() -> void: #On start
	audio_stream_player.play() #Play music
	WindowManager.add_window("BRAVERY") #Create window with a title "BRAVERY"
	await timer.timeout #Wait till timer finishes
	WindowManager.add_window("PERSEVERANCE") #Create window with a title "PERSEVERANCE"
	await timer.timeout #Wait till timer finishes
	WindowManager.add_window("INTEGRITY") #Create window with a title "INTEGRITY"
	await timer.timeout #Wait till timer finishes
	WindowManager.add_window("PATIENCE") #Create window with a title "PATIENCE"
	await timer.timeout #Wait till timer finishes
	WindowManager.add_window("KINDNESS") #Create window with a title "KINDNESS"
	await timer.timeout #Wait till timer finishes
	WindowManager.add_window("JUSTICE") #Create window with a title "JUSTICE"
	await timer.timeout #Wait till timer finishes
	is_spinning = true #start rapidly spinning


func _process(delta: float) -> void: #While running
	for window in WindowManager.windows:
		var index = window.get_meta("Index")
		var offset = RAD_60*index-RAD_60*1.5 #Offset for placing windows 60 deg angle apart form each other
		WindowManager.move_window_in_circle(window, time + offset) #SPIIIIIINNNNNNNNNN
	time += speed #Increase time with speed
	if is_spinning: #If true:
		speed += 0.0001 #Increase speed
		speed = clampf(speed,0.0,0.1) #Don't let it to go out of hand
