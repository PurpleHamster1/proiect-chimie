extends VBoxContainer

@export var tip : String

@onready var panel = $Selection
# Called when the node enters the scene tree for the first time.
func _ready():
	var test = panel.get_theme_stylebox("panel")
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
		"MetalPT":
			test.bg_color = Color.WEB_GRAY
		"Metalo":
			test.bg_color = Color.LIGHT_BLUE
		"Nemetal":
			test.bg_color = Color.LIGHT_GREEN
		"Halo":
			test.bg_color = Color.LIGHT_YELLOW
		"Nobil":
			test.bg_color = Color.MEDIUM_PURPLE
	panel.add_theme_stylebox_override("panel", test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_selection_mouse_entered():
	Global.hover = tip


func _on_selection_mouse_exited():
	await get_tree().create_timer(0.08).timeout
	if Global.hover == tip:
		Global.hover = "none"
