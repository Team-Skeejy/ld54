extends CharacterBody3D


@export var pointer:Node3D
@export var speed:float

@export var angle_step:float
@export var distance:float


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var angle=1

func _physics_process(delta):

	#We have to make sure the distance from the center stays constant othewise we will tend to drift inwards
	var newPos= transform.origin.rotated(Vector3(0,1,0),angle_step).normalized()*distance
	

	var mag=position.distance_to(Vector3(0,0,0))
	print_debug("mag=",mag)

	
	velocity=  transform.origin.direction_to(newPos) *speed*delta
	
	pointer.position=newPos

	print_debug("velocity=",velocity)
	
	move_and_slide()
