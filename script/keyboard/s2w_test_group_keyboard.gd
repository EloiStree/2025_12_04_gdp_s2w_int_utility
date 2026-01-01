class_name S2W_TestGroupeKeyboard 
extends Node

@export var keyboard_to_test : S2W_Node_Keyboard
@export var use_auto_start : bool = true
@export var time_before_testing_start: float = 0.5

@export var time_when_pressing_key : float = 0.5
@export var time_between_pressing_key : float = 0.5

@export var test_10_seconds_ninja : bool = true
@export var test_arrows_keys : bool = true
@export var test_top_numberical_keys : bool = true
@export var test_numpad_numberical_keys : bool = true
@export var test_numpad_side_buttons : bool = true
@export var test_a_to_z : bool = true
@export var test_f1_to_f12 : bool = true


func wait_time(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func wait_time_between_keys() -> void:
	await get_tree().create_timer(time_between_pressing_key).timeout

func wait_time_when_pressing_key() -> void:
	await get_tree().create_timer(time_when_pressing_key).timeout

func press_release_test(key: S2W_Enum_Keyboard.EnumIntegerKeyboard) -> void:
	keyboard_to_test.press_key(key)
	await wait_time_when_pressing_key()
	keyboard_to_test.release_key(key)
	await wait_time_between_keys()

func _ready() -> void:
	

	if use_auto_start:
		print("Starting automatic keyboard test...")
		wait_time(time_before_testing_start)
		print("Automatic keyboard test started.")
		
		if test_10_seconds_ninja:
			print("Testing 10 seconds ninja game keys...")
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.R)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.Right)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.Left)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.Up)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.X)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.Z)
			await press_release_test(S2W_Enum_Keyboard.EnumIntegerKeyboard.R)
		if test_arrows_keys:
			print("Testing arrow keys...")
			keyboard_to_test.press_arrow_left()
			wait_time(time_when_pressing_key)
			keyboard_to_test.release_arrow_left()
			wait_time(time_between_pressing_key)
			keyboard_to_test.press_arrow_right()
			await wait_time(time_when_pressing_key)
			keyboard_to_test.release_arrow_right()
			await wait_time(time_between_pressing_key)
			keyboard_to_test.press_arrow_up()
			await wait_time(time_when_pressing_key)
			keyboard_to_test.release_arrow_up()
			await wait_time(time_between_pressing_key)
			keyboard_to_test.press_arrow_down()
			await wait_time(time_when_pressing_key)
			keyboard_to_test.release_arrow_down()
			await wait_time(time_between_pressing_key)
