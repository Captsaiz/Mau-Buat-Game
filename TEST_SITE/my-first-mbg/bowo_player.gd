extends CharacterBody2D

@onready var joko = get_parent().get_node("jokoObj")

func _physics_process(_delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()

func _on_joko_obj_body_entered(body: Node2D) -> void:
	if body.is_in_group('player') and not $heldGodot.visible :
		joko.set_deferred("monitoring", false)
		joko.queue_free()
		$heldGodot.visible = true

func _on_istana_negara_body_entered(body: Node2D) -> void:
	if body.is_in_group('player') and $heldGodot.visible :
		$heldGodot.visible = false
