extends Node

@export var to_send:S2W_Data_Gamepad1817
@export var receiver:S2W_Data_Gamepad1817
@export var int_18:int
@export var int_17:int
@export var int_17_string_with_tag:String
@export var int_17_string_without_tag:String

signal on_value_changed(int_value:int)



func _ready() -> void:
	receiver = receiver.duplicate(true)

func _process(delta: float) -> void:
	var double_int :Array[int]= S2W_IntBinaryUtility.gamepad_resource_to_double_integer(to_send)	
	var int_17_previous = int_17
	var int_18_previous = int_18
	int_17 = double_int[0]
	int_18 = double_int[1]
	S2W_IntBinaryUtility.apply_int17_to_game_resource(double_int[0],receiver)
	S2W_IntBinaryUtility.apply_int18_to_game_resource(double_int[1],receiver)
	int_17_string_with_tag = S2W_IntBinaryUtility.as_binary_string(int_17)
	int_17_string_without_tag = S2W_IntBinaryUtility.as_binary_string(int_17-1700000000)

	if int_17_previous != int_17:
		on_value_changed.emit(int_17)
	if int_18_previous != int_18:
		on_value_changed.emit(int_18)	
