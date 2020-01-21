extends Area2D

var velocity = Vector2()
var walked = 0
var dir = "left"
var started = false

func _physics_process(delta):
	if walked <= 300 && dir == "left":
		$AnimatedSprite.flip_h = false
		self.position.x -= 0.5
		walked += 1
		print(walked)
	else:
		dir = "right"
	if walked >= -300 && dir == "right":
		$AnimatedSprite.flip_h = true
		self.position.x += 0.5
		walked -= 1
		print(walked)
	else:
		dir = "left"
	
	
	if $Panel/Label.text == "":
		$Timer.stop()
		started = false
		print($Panel/Label.text)
	else:
		$Panel.show()
		if started == false:
			started = true
			$Timer.start()


func _on_Timer_timeout():
	$Panel.hide()
	$Panel/Label.text = ""
