extends Position2D

func _ready():
	print("ready")
	self.add_to_group("places_free")
	print(self.get_groups())

func block():
	print("block")
	self.remove_from_group("places_free")
	self.add_to_group("places_used")
	print(self.get_groups())

func unblock():
	print("unblock")
	self.remove_from_group("places_used")
	self.add_to_group("places_free")
	print(self.get_groups())
