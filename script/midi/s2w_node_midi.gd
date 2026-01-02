class_name S2W_MidiNode extends Node

signal on_integer_generated(integer_value:int)

func press_midi_note(note_value_0_127:int):
	press_release_midi_note(true,note_value_0_127)
	
func release_midi_note(note_value_0_127:int):
	press_release_midi_note(false,note_value_0_127)
	
func press_release_midi_note(note_pressing:bool , note_value_0_127:int):
	if note_value_0_127<0:
		note_value_0_127=0
	if note_value_0_127>=127:
		note_value_0_127=127
		
	if (note_pressing):
		on_integer_generated.emit(1600+note_value_0_127)
	else:
		on_integer_generated.emit(2600+note_value_0_127)

func press_random_note_for_a_seconds(seconds: float = 1.0) -> void:
	var random_note: int = randi_range(0, 127)
	press_midi_note(random_note)
	await get_tree().create_timer(seconds).timeout
	release_midi_note(random_note)


func send_raw_triples_bytes(left_to_right_1: int, left_to_right_2: int, left_to_right_3: int) -> int:
	# NOT TESTED YET
	var value_to_send_left_to_right_0: int = 1300000000

	# ensure byte-sized
	var b0 = value_to_send_left_to_right_0 & 0xFF
	var b1 = left_to_right_1 & 0xFF
	var b2 = left_to_right_2 & 0xFF
	var b3 = left_to_right_3 & 0xFF

	# pack as 4 bytes (b0..b3) into a single int
	var result = (b0 << 24) | (b1 << 16) | (b2 << 8) | b3
	return result
