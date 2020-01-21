extends KinematicBody2D

var velocity = Vector2()
var floor_val = Vector2(0,-1)
var jump_force = 0
var direction = "idle"
var jump_stat = "up"

func _physics_process(delta):
	
	update()
	if self.is_on_floor():
		if Input.is_action_pressed("ui_right"):
			direction = "right"
			$AnimatedSprite.flip_h = false
		if Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h = true
			direction = "left"
		velocity.x = 0
		#direction = "idle"
		if Input.is_action_pressed("ui_jump"):
			if jump_force >= -500 && jump_stat == "up":
				jump_force -= 20
			#else:
				#jump_stat = "down"
				#if jump_force != 0 && jump_stat == "down":
				#	jump_force += 20
				#else:
				#	jump_stat = "up"
			direction = "charging"
			$AnimatedSprite.play("charging")
			print("Force: " , jump_force)
		elif Input.is_action_just_released("ui_jump"):
			var sfx = load("res://Sounds/jump.wav")
			#sfx.set_loop(true)
			$Sound.stream = sfx
			$Sound.play()
			if direction == "right":
				velocity.x = 200
			elif direction == "left":
				velocity.x = -200
			#direction = "jump"
			$AnimatedSprite.play("jump")
			velocity.y = jump_force
			jump_force = 0
		else:
			$AnimatedSprite.play("idle")
	elif self.is_on_wall():
		print("on wall")
		var sfv = load("res://Sounds/bounce.ogg")
		sfv.set_loop(false)
		$Sound.stream = sfv
		$AnimatedSprite.play("jump")
		if direction == "right":
			$Sound.play(0)
			velocity.x = -200
			direction = "left"
		elif direction == "left":
			$Sound.play(0)
			velocity.x = 200
			direction = "right"
		print(direction)
	else:
		$AnimatedSprite.play("jump")
		velocity.y += 20
	velocity = move_and_slide(velocity, floor_val)
	
	





func _on_KinematicBody2D_draw():
	if direction == "left":
		$AnimatedSprite.flip_h = true
		draw_circle(Vector2(-30,0),10, Color(0,1,0))
	elif direction == "right":
		$AnimatedSprite.flip_h = false
		draw_circle(Vector2(30,0),10, Color(0,1,0))






