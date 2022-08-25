extends Control

export(String, FILE, "*.tscn") var startScene

onready var mainMenu = get_node("MainPanel")
onready var optionsMenu = get_node("OptionsPanel")

func _ready():
	mainMenu.get_node("Main/StartButton").grab_focus()

func _on_StartButton_pressed():
#	Zmiana sceny na wskazaną w node menu.
	get_tree().change_scene(startScene)

func _on_OptionsButton_pressed():
#	NIE WIEM CZY TO NAJLEPSZY SPOSÓB. ALE DZIAŁA.
	optionsMenu.visible = true
	optionsMenu.get_node("Options/MasterHbox/SoundMasterSlider").grab_focus()

func _on_BackButton_pressed():
	optionsMenu.visible = false
	mainMenu.get_node("Main/StartButton").grab_focus()

func _on_SoundMasterSlider_value_changed(value):
#	VALUE JEST W DECYBELACH. Nie rozwal sobie uszu (Tak, zrobiłem to, 100 volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), value)

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

func _on_QuitButton_pressed():
#	Hehe
	get_tree().quit()
