class_name  S2W_Node_Keyboard
extends Node

signal on_integer_keystroke_requested(integer_value:int)


@export var last_pushed : Array[int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


	
func push_raw_integer(value:int):
	on_integer_keystroke_requested.emit(value)
	add_to_debug_pushed(value)

func press_key(key : S2W_Enum_Keyboard.EnumIntegerKeyboard):
	push_raw_integer(int(key))

func release_key(key : S2W_Enum_Keyboard.EnumIntegerKeyboard):
	var keyPlusOffset = int(key) + 1000
	push_raw_integer(keyPlusOffset)

func add_to_debug_pushed(pushed_integer:int):
	# move the array of one case then insert the new value at the start
	for i in range(last_pushed.size()-1,0,-1):
		last_pushed[i] = last_pushed[i-1]
	last_pushed[0] = pushed_integer
	
func press_release_key(pressing:bool , key : S2W_Enum_Keyboard.EnumIntegerKeyboard):
	if pressing:
		press_key(key)
	else:
		release_key(key)

func press_enter():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Enter)
	
func release_enter():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Enter)
	
func press_space():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Space)
func release_space():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Space)

# Same for left ctrl shift alt
func press_left_ctrl():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftControl)
func release_left_ctrl():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftControl)

func press_left_shift():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftShift)
func release_left_shift():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftShift)

func press_left_alt():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftAlt)
func release_left_alt():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.LeftAlt)

# Same for tab capslock escape backspace
func press_tab():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Tab)
func release_tab():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Tab)

func press_capslock():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.CapsLock)
func release_capslock():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.CapsLock)

func press_escape():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Escape)
func release_escape():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Escape)

func press_backspace():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Backspace)
func release_backspace():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Backspace)

# Same for insert delete home end pageup pagedown
func press_insert():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Insert)
func release_insert():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Insert)

func press_delete():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Delete)
func release_delete():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Delete)

func press_home():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Home)
func release_home():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Home)

func press_end():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.End)
func release_end():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.End)

func press_pageup():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.PageUp)
func release_pageup():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.PageUp)

func press_pagedown():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.PageDown)
func release_pagedown():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.PageDown)

# Same for arrows left up down right
func press_arrow_left():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Left)
func release_arrow_left():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Left)

func press_arrow_up():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Up)
func release_arrow_up():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Up)

func press_arrow_down():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Down)
func release_arrow_down():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Down)

func press_arrow_right():
	press_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Right)
func release_arrow_right():
	release_key(S2W_Enum_Keyboard.EnumIntegerKeyboard.Right)


func press_top_number_key(value_0_9:int):
	press_release_top_number_key(true, value_0_9)
	
func release_top_number_key(value_0_9:int):
	press_release_top_number_key(false, value_0_9)
	
func press_keypad_number_key(value_0_9:int):
	press_release_keypad_number_key(true, value_0_9)
	
func release_keypad_number_key(value_0_9:int):
	press_release_keypad_number_key(false, value_0_9)


func press_release_top_number_key(pressing:bool,value_0_9:int):
	match value_0_9:
		0: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha0)
		1: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha1)
		2: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha2)
		3: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha3)
		4: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha4)
		5: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha5)
		6: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha6)
		7: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha7)
		8: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha8)
		9: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Alpha9) 
	pass
	

func press_release_keypad_number_key(pressing:bool,value_0_9:int):
	match value_0_9:
		0: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad0)
		1: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad1)
		2: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad2)
		3: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad3)
		4: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad4)
		5: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad5)
		6: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad6)
		7: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad7)
		8: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad8)
		9: 
			press_release_key(pressing,S2W_Enum_Keyboard.EnumIntegerKeyboard.Numpad9) 
	pass
	
func write_char(char: String):
	if char in S2W_Enum_Keyboard.char_to_integer:
		on_integer_keystroke_requested.emit(S2W_Enum_Keyboard.char_to_integer[char])
	
