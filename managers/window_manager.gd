extends Node

const WINDOW = preload("res://ui/window/window.tscn")

var windows: Array = [] #An Array of active windows
var index: int = 0

#--------------------------------------------------------------------------------------------------#


func add_window(title: String) -> void: #Adds an instance of a window to the array
	var window: Window = WINDOW.instantiate() #Create
	windows.append(window) #Add window to the array of windows 
	window.set_meta("Index",index) #Sets metadata/Index to last 
	window.title = title #Sets window title
	add_child(window) #Adds it to scene tree
	index += 1 #Change index to the last place on the Array


func remove_window(position: int) -> void: #Removes an instance of a window from the array and from scene tree
	var window = windows[position] #Pick a window through position parameter
	windows.remove_at(position) #Remove from array
	window.queue_free() #Remove from scene tree
	index -= 1 #Change index to the last place on the Array


func move_window_in_circle(window: Window, time: float) -> void: #moves window in offset in a circle
	var display_size: Vector2 = DisplayServer.screen_get_size() #Get display size
	var window_size: Vector2 = window.get_size() #Get soul window size
	var offset: Vector2 = display_size/2.0 - window_size/2.0 #Make an offset using those variables (center of the screen)
	var circle: Vector2 = Vector2(cos(time),sin(time))*500.0 + offset #Trigonometry + offset
	var position: Vector2 = window.position #bug, otherwise for some reason it doesn't work
	window.position = lerp(position,circle,0.1) #move with linear interpolation to the target position
