extends Position2D

func _ready():
	self.add_to_group("places_free")

func block():
	self.remove_from_group("places_free")
	self.add_to_group("places_used")

func unblock():
	self.remove_from_group("places_used")
	self.add_to_group("places_free")
