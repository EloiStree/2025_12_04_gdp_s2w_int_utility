class_name S2W_MediaControl extends Node

signal on_integer_generated(integer_value:int)

func volume_increment(integer_value:int):
	on_integer_generated.emit(1175)
	
func volume_decrement(integer_value:int):
	on_integer_generated.emit(1174)

func volume_mute(integer_value:int):
	on_integer_generated.emit(1173)

func media_play(integer_value:int):
	on_integer_generated.emit(1179)

func media_stop(integer_value:int):
	on_integer_generated.emit(1178)
	
func media_next_track(integer_value:int):
	on_integer_generated.emit(1176)

func media_previous_track(integer_value:int):
	on_integer_generated.emit(1177)

	
