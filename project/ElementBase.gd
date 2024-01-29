extends Panel

@export var tip : String
@export var nr : String
@export var simbol : String
@export var nume : String
@export var masa : String
@export_multiline var desc : String
@export var onLeft : bool = false

@onready var popUp = $PopUp
@onready var popUpDesc = $PopUp/Desc
@onready var id = $Id
@onready var symbol = $Symbol
@onready var longName = $Name
@onready var mass = $Mass

var mouseHover = false
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
			test.bg_color = Color.WEB_GRAY
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
	
	if onLeft == true:
		popUp.position.x = -popUp.size.x



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	if tip != "Empty":
		mouseHover = true
		scale = Vector2(1.05, 1.05)
		await get_tree().create_timer(0.5).timeout
		if mouseHover == true:
			popUp.visible = true

func _on_mouse_exited():
	if tip != "Empty":
		scale = Vector2(1,1)
		mouseHover = false
		popUp.visible = false
