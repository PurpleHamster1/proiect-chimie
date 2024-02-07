extends VBoxContainer

@export var tip : String

@onready var panel = $Selection

var tween
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
			test.bg_color = Color.LIGHT_SLATE_GRAY
		"Metalo":
			test.bg_color = Color.LIGHT_BLUE
		"Nemetal":
			test.bg_color = Color.LIGHT_GREEN
		"Halo":
			test.bg_color = Color.LIGHT_YELLOW
		"Nobil":
			test.bg_color = Color.MEDIUM_PURPLE
	test.border_width_left = 1
	test.border_width_top = 1
	test.border_width_right = 1
	test.border_width_bottom = 1
	test.border_color = Color.WHITE_SMOKE
	panel.add_theme_stylebox_override("panel", test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.hover != tip and Global.hover != "none":
		if modulate.a == 1:
			tween = get_tree().create_tween().tween_property(self, "modulate:a", 0.25, 0.5)
			await tween.finished
	else: 
		if modulate.a == 0.25:
			if Global.hover == "none":
				await get_tree().create_timer(0.2).timeout
				if Global.hover == "none":
					tween = get_tree().create_tween().tween_property(self, "modulate:a", 1, 0.5)
			else:
				tween = get_tree().create_tween().tween_property(self, "modulate:a", 1, 0.5)
			await tween.finished





func _on_selection_mouse_entered():
	await get_tree().create_timer(0.08).timeout
	Global.hover = tip


func _on_selection_mouse_exited():
	await get_tree().create_timer(0.08).timeout
	if Global.hover == tip:
		Global.hover = "none"
