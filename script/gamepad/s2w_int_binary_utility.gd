class_name S2W_IntBinaryUtility extends Resource

const BINARY_TAG: int = 1700000000  # 01100101010100111111000100000000

static func turn_from_1_to_99_as_percent(value: int) -> float:
	# clamp value between 0 and 99
	value = clamp(value, 0, 99)

	if value == 0:
		return 0.0
	# Turn 1 to 99 to -1.0 to 1.0
	value-=1
	var percent:float = value/98.0
	percent = percent * 2.0 - 1.0
	return percent


static func turn_from_percent_to_1_to_99(value: float) -> int:
	#clamp value between -1.0 and 1.0
	value = clamp(value, -1.0, 1.0)
	if value == 0.0:
		return 0
	var result = 1 + int(((value + 1.0) / 2.0) * 98.0 )
	return result


static func four_float_to_gamepad18(
	left_horizontal: float,
	 left_vertical: float,
	  right_horizontal: float,
	   right_vertical: float
	   ) -> int:
	var result: int = 1800000000 
	result += turn_from_percent_to_1_to_99(left_horizontal) * 1000000
	result += turn_from_percent_to_1_to_99(left_vertical) * 10000
	result += turn_from_percent_to_1_to_99(right_horizontal) * 100
	result += turn_from_percent_to_1_to_99(right_vertical) * 1
	return result


static func gamepad18_to_four_float(value: int) -> Array:
	# 18 50 20 00 10
	# 1850200010
	# 4 bytes because integer
	var left_horizontal_from_1_to_99: int = (value / 1000000) % 100
	var left_vertical_from_1_to_99: int = (value / 10000) % 100
	var right_horizontal_from_1_to_99: int = (value / 100) % 100
	var right_vertical_from_1_to_99: int = (value / 1) % 100

	var left_horizontal: float = turn_from_1_to_99_as_percent(left_horizontal_from_1_to_99)
	var left_vertical: float = turn_from_1_to_99_as_percent(left_vertical_from_1_to_99)
	var right_horizontal: float = turn_from_1_to_99_as_percent(right_horizontal_from_1_to_99)
	var right_vertical: float = turn_from_1_to_99_as_percent(right_vertical_from_1_to_99)
	return [left_horizontal, left_vertical, right_horizontal, right_vertical]



static func is_integer_bit_right_to_left_true(value: int, index: int) -> bool:
	# Don't forget to remove the tag (like 1700000000)
	return (value & (1 << index)) != 0


static func int_to_binary_string(value: int) -> String:
	var result: String = ""
	for i in range(32):
		result = ("1" if (value & (1 << i)) else "0") + result
	return result


static func int_to_binary_string_with_tag(value: int) -> String:
	var result: String = ""
	for i in range(32):
		var inverse: bool = (BINARY_TAG & (1 << i)) != 0
		var bit: bool = (value & (1 << i)) != 0
		result = ("0" if (bit and inverse) else ("1" if bit else ("1" if inverse else "0"))) + result
	return result



static func gamepad_resource_to_1700000000_integer(gamepad: S2W_Data_Gamepad1817) -> int:
		var result: int = 0
		
		# Set button bits
		if gamepad.button_y_up:
			result |= (1 << 0)
		if gamepad.button_b_right:
			result |= (1 << 1)
		if gamepad.button_a_down:
			result |= (1 << 2)
		if gamepad.button_x_left:
			result |= (1 << 3)

		if gamepad.arrow_up:
			result |= (1 << 4)
		if gamepad.arrow_right:
			result |= (1 << 5)
		if gamepad.arrow_down:
			result |= (1 << 6)
		if gamepad.arrow_left:
			result |= (1 << 7)

		if gamepad.side_button_left:
			result |= (1 << 8)
		if gamepad.side_button_right:
			result |= (1 << 9)
			
		if gamepad.stick_joystick_left:
			result |= (1 << 10)
		if gamepad.stick_joystick_right:
			result |= (1 << 11)

		if gamepad.menu_left:
			result |= (1 << 12)
		if gamepad.menu_center:
			result |= (1 << 13)
		if gamepad.menu_right:
			result |= (1 << 14)
		if gamepad.kill_switch_or_is_connected:
			result |= (1 << 15)
		

		#binary order
		#0.10  16 20
		#0.15  17 21
		#0.25  18 22
		#0.50  19 23

		var tl = gamepad.trigger_left_axis_01_percent
		if tl > 0.99:
			result |= (1 << 16)
			result |= (1 << 17)
			result |= (1 << 18)
			result |= (1 << 19)
		if tl > 0.74:
			result |= (1 << 18)
			result |= (1 << 19)
		elif tl > 0.49:
			result |= (1 << 19)
		elif tl > 0.24:
			result |= (1 << 18)
		elif tl > 0.14:
			result |= (1 << 17)
		elif tl > 0.09:
			result |= (1 << 16)
		
		var tr = gamepad.trigger_right_axis_01_percent
		if tr > 0.99:
			result |= (1 << 20)
			result |= (1 << 21)
			result |= (1 << 22)
			result |= (1 << 23)
		if tr > 0.74:
			result |= (1 << 22)
			result |= (1 << 23)
		elif tr > 0.49:
			result |= (1 << 23)
		elif tr > 0.24:
			result |= (1 << 22)
		elif tr > 0.14:
			result |= (1 << 21)
		elif tr > 0.09:
			result |= (1 << 20)

		# Decode trigger values from bits
		# Left trigger: bits 16-19
		# Right trigger: bits 20-23
		# Pattern: 0.10 (16/20), 0.15 (17/21), 0.25 (18/22), 0.50 (19/23)
		
		# This is the decoding logic (inverse of encoding above)
		# For reference when implementing the decode function:
		# var trigger_left = 0.0
		# var trigger_right = 0.0
		# if is_integer_bit_right_to_left_true(value, 16): trigger_left += 0.10
		# if is_integer_bit_right_to_left_true(value, 17): trigger_left += 0.15
		# if is_integer_bit_right_to_left_true(value, 18): trigger_left += 0.25
		# if is_integer_bit_right_to_left_true(value, 19): trigger_left += 0.50
		# if is_integer_bit_right_to_left_true(value, 20): trigger_right += 0.10
		# if is_integer_bit_right_to_left_true(value, 21): trigger_right += 0.15
		# if is_integer_bit_right_to_left_true(value, 22): trigger_right += 0.25
		# if is_integer_bit_right_to_left_true(value, 23): trigger_right += 0.50

		# C# old before change of S2W structure Need to be change on Unity3D too.
		# https://github.com/EloiStree/OpenUPM_PushGenericIID/blob/main/Runtime/STRUCT/Gamepad/GamepadId2020Extra.cs
		# https://github.com/EloiStree/OpenUPM_PushGenericIID/blob/main/Runtime/PushMono/IntegerToGamepad2020Utility.cs

		return result + 1700000000



static func as_binary_string(value:int)->String:
	var text :String=""
	for i in range(24):
		if is_integer_bit_right_to_left_true(value, i):
			text = "1"+text 
		else : 
			text = "0"+text 
	return text
	


# turn a gamepad resource state in two integer to send on the network. Compressed version to uncompress on the other side
### NOT TESTED YET ###
static func gamepad_resource_to_double_integer(gamepad : S2W_Data_Gamepad1817)-> Array[int]:
	var int_18: int = four_float_to_gamepad18(
		gamepad.joystick_left_horizontal_axis_n1_p1_percent,
		gamepad.joystick_left_vertical_axis_n1_p1_percent,
		gamepad.joystick_right_horizontal_axis_n1_p1_percent,
		gamepad.joystick_right_vertical_axis_n1_p1_percent
	)
	var int_17: int = gamepad_resource_to_1700000000_integer(gamepad)
	return [int_17, int_18]



### NOT TESTED YET ###
static func apply_int18_to_game_resource(value_1800000000: int, gamepad: S2W_Data_Gamepad1817):
	var array = gamepad18_to_four_float(value_1800000000)
	gamepad.joystick_left_horizontal_axis_n1_p1_percent = array[0]
	gamepad.joystick_left_vertical_axis_n1_p1_percent = array[1]
	gamepad.joystick_right_horizontal_axis_n1_p1_percent = array[2]
	gamepad.joystick_right_vertical_axis_n1_p1_percent = array[3]


### NOT TESTED YET ###
static func apply_int17_to_game_resource(value_1700000000:int , gamepad : S2W_Data_Gamepad1817 ):
	if value_1700000000 >= 1700000000 and value_1700000000 < 1800000000:
		value_1700000000 -= 1700000000
		gamepad.button_y_up = is_integer_bit_right_to_left_true(value_1700000000, 0)
		gamepad.button_b_right = is_integer_bit_right_to_left_true(value_1700000000, 1)
		gamepad.button_a_down = is_integer_bit_right_to_left_true(value_1700000000, 2)
		gamepad.button_x_left = is_integer_bit_right_to_left_true(value_1700000000, 3)
		gamepad.arrow_up = is_integer_bit_right_to_left_true(value_1700000000, 4)
		gamepad.arrow_right = is_integer_bit_right_to_left_true(value_1700000000, 5)
		gamepad.arrow_down = is_integer_bit_right_to_left_true(value_1700000000, 6)
		gamepad.arrow_left = is_integer_bit_right_to_left_true(value_1700000000, 7)
		gamepad.side_button_left = is_integer_bit_right_to_left_true(value_1700000000, 8)
		gamepad.side_button_right = is_integer_bit_right_to_left_true(value_1700000000, 9)
		gamepad.stick_joystick_left = is_integer_bit_right_to_left_true(value_1700000000, 10)
		gamepad.stick_joystick_right = is_integer_bit_right_to_left_true(value_1700000000, 11)
		gamepad.menu_left = is_integer_bit_right_to_left_true(value_1700000000, 12)
		gamepad.menu_center = is_integer_bit_right_to_left_true(value_1700000000, 13)
		gamepad.menu_right = is_integer_bit_right_to_left_true(value_1700000000, 14)
		gamepad.kill_switch_or_is_connected = is_integer_bit_right_to_left_true(value_1700000000, 15)

		# Decode trigger values from bits
		var trigger_left = 0.0
		var trigger_right = 0.0
		if is_integer_bit_right_to_left_true(value_1700000000, 16): trigger_left += 0.10
		if is_integer_bit_right_to_left_true(value_1700000000, 17): trigger_left += 0.15
		if is_integer_bit_right_to_left_true(value_1700000000, 18): trigger_left += 0.25
		if is_integer_bit_right_to_left_true(value_1700000000, 19): trigger_left += 0.50
		if is_integer_bit_right_to_left_true(value_1700000000, 20): trigger_right += 0.10
		if is_integer_bit_right_to_left_true(value_1700000000, 21): trigger_right += 0.15
		if is_integer_bit_right_to_left_true(value_1700000000, 22): trigger_right += 0.25
		if is_integer_bit_right_to_left_true(value_1700000000, 23): trigger_right += 0.50

		gamepad.trigger_left_axis_01_percent = trigger_left
		gamepad.trigger_right_axis_01_percent = trigger_right
	
