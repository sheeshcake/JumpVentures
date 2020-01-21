extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter = 0
var counter1 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#var speech_player = $AudioStreamPlayer2D.new()
	var audio_file = "res://Sounds/Iceland Theme.ogg"
	if File.new().file_exists(audio_file):
		print("playing")
		var sfx = load(audio_file) 
		sfx.set_loop(true)
		$AudioStreamPlayer2D.stream = sfx
		$AudioStreamPlayer2D.play()
	else:
		print("no sound file")

func _on_Area2D_body_entered(body):
	print(body)
	if body == $KinematicBody2D:
		$Snail/Panel/Label.text = dialouge.tutorial_area(counter)
		counter += 1


func _on_Area2D2_body_entered(body):
	if body == $KinematicBody2D:
		$Snail/Panel/Label.text = dialouge.second_fall(counter1)
		counter1 += 1


func _on_Area2D3_body_entered(body):
	if body == $KinematicBody2D:
		$Label2.text = "Oh i forgot this is just a Alpha no ending yet :)"
