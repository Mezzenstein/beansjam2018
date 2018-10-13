extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect('body_entered',self,'_on_Area2D_area_entered')

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _on_Area2D_area_entered(body):
	if(body.get_name() == 'Player'):
		print("entered")