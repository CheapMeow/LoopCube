extends KinematicBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 150

var velocity = Vector2()
var is_colliding := false

onready var _fx_player: FXPlayer = GlobalLevelConst.game_root.get_node("FXPlayer")
var collision_sound = preload("res://Assets/Sound/FX/wall_collision.wav")

onready var hit_effect = get_parent().get_node("HitEffect")

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
	
	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
		
	var collisionCounter = get_slide_count()
	if collisionCounter > 0:
		if not is_colliding:
			# play music
			is_colliding = true
			_fx_player.play(collision_sound)
			# play hit effect
			var first_collision : KinematicCollision2D = get_slide_collision(0)
			if(first_collision != null && hit_effect != null):
				hit_effect.global_position = first_collision.position
				hit_effect.rotation = (Vector2.RIGHT).angle_to(first_collision.normal)
				if hit_effect.has_method("play_effect_once"):
					hit_effect.play_effect_once()
	else:
		is_colliding = false
		
