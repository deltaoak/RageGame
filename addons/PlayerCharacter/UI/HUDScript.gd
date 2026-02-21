extends CanvasLayer

class_name HUD

#label references variables
@onready var currentStateLT = %CurrentStateLabelText
@onready var desiredMoveSpeedLT = %DesiredMoveSpeedLabelText
@onready var velocityLT = %VelocityLabelText
@onready var nbJumpsInAirAllowedLT = %NbJumpsInAirAllowedLabelText
@onready var framesPerSecondLT = %FramesPerSecondLabelText
@onready var rageFocusLT = %RageFocusLabelText
@onready var rageFocusFilter = %RageFocusFilter
@onready var timeScaleLT = %TimeScaleLabelText

func _process(_delta):
	displayCurrentFPS()
	
func displayCurrentState(currentState : String):
	currentStateLT.set_text(str(currentState))
	
func displayDesiredMoveSpeed(desiredMoveSpeed : float):
	desiredMoveSpeedLT.set_text(str(desiredMoveSpeed))
	
func displayVelocity(velocity : float):
	velocityLT.set_text(str(velocity))
	
func displayNbJumpsInAirAllowed(nbJumpsInAirAllowed : int):
	nbJumpsInAirAllowedLT.set_text(str(nbJumpsInAirAllowed))
	
func displayCurrentFPS():
	framesPerSecondLT.set_text(str(Engine.get_frames_per_second()))
	
func displayRageFocus(rageFocus: float):
	rageFocusLT.set_text(str(rageFocus))
	var mat = rageFocusFilter.material
	mat.set_shader_parameter("strength", abs(rageFocus ** 2))
	if rageFocus < 0:
		mat.set_shader_parameter("R", 1.0)
		mat.set_shader_parameter("G", 0.0)
		mat.set_shader_parameter("B", 0.0)
	else:
		mat.set_shader_parameter("R", 0.0)
		mat.set_shader_parameter("G", .5)
		mat.set_shader_parameter("B", 1.0)
	
func displayTimeDelta(time: float):
	timeScaleLT.set_text(str(time))
	
	
	
	
