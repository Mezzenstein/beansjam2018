extends KinematicBody2D

# target
var place = null
var timer = 0

# path
var path = []
var currentPathPosition = 0
var speed = 3000

func _ready():
	# Find free Place
	self.global_position = Vector2(32, 32)
	setNewTimer()

func _process(delta):
	if (path.size() > 0):
		run(delta)
		return

	timer -= delta
	
	if (timer <= 0):
		goToNewPlace()
		return

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
			rotation = (place.global_position - self.global_position).normalized().angle()

func goToNewPlace():
	if (place != null):
		place.unblock()

	findFreePlace()
	setNewTimer()

	if (place == null):
		return
	
	var nav = get_node("/root/World/level/Navigation2D")
	path = nav.getPath(self, place.global_position)

	print(path.size())
	currentPathPosition = 0
	self.update()

func findFreePlace():
	var places = get_tree().get_nodes_in_group("places_free")

	place = places[randi() % places.size()]

	if place != null:
		place.block()

# Random Timer
func setNewTimer():
		timer = rand_range(5,20)
