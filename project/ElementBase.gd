extends Panel

@export var tip : String
@export var nr : String
@export var simbol : String
@export var nume : String
@export var masa : String
@export_multiline var desc : String
@export var onLeft : bool = false
@export var yOff : int = 0

@onready var popUp = $PopUp
@onready var popUpDesc = $PopUp/Desc
@onready var id = $Id
@onready var symbol = $Symbol
@onready var longName = $Name
@onready var mass = $Mass

var mouseHover = false
var tween
var scaleTween
var timesEntered = 0
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
	add_theme_stylebox_override("panel", test)
	id.text = nr
	symbol.text = simbol
	longName.text = nume
	mass.text = masa
	popUpDesc.text = desc
	popUp.position.y += yOff
	
	if onLeft == true:
		popUp.position.x = -popUp.size.x



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.hover != tip and Global.hover != "none":
		if modulate.a == 1:
			tween = get_tree().create_tween().tween_property(self, "modulate:a", 0.25, 0.5)
			await tween.finished
		#modulate.a = 0.5
	else:
		if modulate.a == 0.25:
			await get_tree().create_timer(0.1).timeout
			if Global.hover == tip or Global.hover == "none":
				tween = get_tree().create_tween().tween_property(self, "modulate:a", 1, 0.5)
				await tween.finished
		#modulate.a = 1


func _on_mouse_entered():
	if tip != "Empty" and nr != "0":
		timesEntered += 1
		mouseHover = true
		scaleTween = get_tree().create_tween()
		scaleTween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
		#scale = Vector2(1.05, 1.05)
		var last = timesEntered
		await get_tree().create_timer(0.5).timeout
		if get_global_rect().has_point(get_global_mouse_position()) == true and timesEntered == last:
			if mouseHover == true:
				popUp.visible = true

func _on_mouse_exited():
	if tip != "Empty" and nr != "0":
		if scaleTween != null:
			scaleTween.kill()
		Global.lastEnter = tip
		await get_tree().create_timer(0.25).timeout
		if get_global_rect().has_point(get_global_mouse_position()) == false:
			scaleTween = get_tree().create_tween().tween_property(self, "scale", Vector2(1,1), 0.1)
		#scale = Vector2(1,1)
		mouseHover = false
		popUp.visible = false
