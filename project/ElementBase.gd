extends Panel

@export var tip : String
@export var nr : String
@export var masa : String

# Called when the node enters the scene tree for the first time.
func _ready():
	var test = get_theme_stylebox("panel")
	match tip:
		"Alca":
			test.bg_color = Color.DARK_KHAKI
		"AlcaP":
			test.bg_color = Color.CORAL
		"Lant":
			test.bg_color = Color.DARK_SEA_GREEN
		"Act":
			test.bg_color = Color.DARK_SLATE_BLUE
		"MetalT":
			test.bg_color = Color.GRAY
		"MetalePT":
			test.bg_color = Color.WEB_GRAY
		"Metalo":
			test.bg_color = Color.LIGHT_GRAY
		"Nemetal":
			test.bg_color = Color.LIGHT_GREEN
		"Halo":
			test.bg_color = Color.LIGHT_YELLOW
		"Nobil":
			test.bg_color = Color.MEDIUM_PURPLE
	add_theme_stylebox_override("panel", test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
