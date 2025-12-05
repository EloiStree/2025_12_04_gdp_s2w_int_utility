extends Node

@export var to_send:S2W_Data_Gamepad1817
@export var receiver:S2W_Data_Gamepad1817
@export var int_18:int
@export var int_17:int
@export var int_17_string_with_tag:String
@export var int_17_string_without_tag:String

func _ready() -> void:
	receiver = receiver.duplicate(true)

func _process(delta: float) -> void:
	var double_int :Array[int]= S2W_IntBinaryUtility.gamepad_resource_to_double_integer(to_send)	
	int_17 = double_int[0]
	int_18 = double_int[1]
	S2W_IntBinaryUtility.apply_int17_to_game_resource(double_int[0],receiver)
	S2W_IntBinaryUtility.apply_int18_to_game_resource(double_int[1],receiver)
	int_17_string_with_tag = S2W_IntBinaryUtility.as_binary_string(int_17)
	int_17_string_without_tag = S2W_IntBinaryUtility.as_binary_string(int_17-1700000000)
	
