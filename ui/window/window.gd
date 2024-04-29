extends Window

const SOUL_COLORS: Array = [Color.ORANGE, Color.PURPLE, Color.BLUE, Color.AQUA, Color.GREEN, Color.YELLOW] #Array of soul colors

@onready var sprite: Sprite2D = $Undertale #Reference to a soul sprite

#--------------------------------------------------------------------------------------------------#

func _ready() -> void: #On start
	set_color(get_meta("Index")) #Set color corresponding to your metadata/Index from SOUL_COLORS


func set_color(pos: int) -> void:
	sprite.modulate = SOUL_COLORS[pos] #Set color to one from SOUL_COLORS using pos parameter
