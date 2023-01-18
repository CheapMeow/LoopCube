extends Node2D

onready var effect : CPUParticles2D = get_node("CPUParticles2D")

func play_effect_once():
	effect.restart()
	effect.emitting = true	
