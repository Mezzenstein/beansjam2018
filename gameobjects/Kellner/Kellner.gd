extends KinematicBody2D

var place = null

# path
var path = []
var currentPathPosition = 0
var speed = 3000

func _ready():
	var spawn = get_node("/root/World/level/Besucherspawn")
	self.global_position = Vector2(spawn.position.x, spawn.position.y)

func _process(delta):
	if (path.size() > 0):
		run(delta)
		return

	goToNewPlace()

func run(delta):
	var target = path[currentPathPosition]
	var velocity = (target - self.global_position).normalized() * (speed * delta)
	rotation = velocity.angle()

	if (target - position).length() > 3:
		move_and_slide(velocity)
	else:
		# new point
		currentPathPosition += 1
		if currentPathPosition > path.size()-1:
			path = []

func goToNewPlace():
	findFreePlace()

	if (place == null):
		return
	
	var nav = get_node("/root/World/level/Navigation2D")
	path = nav.getPath(self, place.global_position)

	currentPathPosition = 0
	self.update()

func findFreePlace():
	var places = get_tree().get_nodes_in_group("places_free")

	place = places[randi() % places.size()]
