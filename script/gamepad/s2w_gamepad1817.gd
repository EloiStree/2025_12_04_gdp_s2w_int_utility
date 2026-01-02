class_name  S2W_Gamepad1817 
extends Node

signal on_integer_to_relayed(int_value:int)

@export var gamepad_data : S2W_Data_Gamepad1817
@export var int18_joysticks:int
@export var int17_buttons_triggers:int
@export var use_frame_check:=true
func force_relay_state_as_int1817():
	var double_int :Array[int]= S2W_IntBinaryUtility.gamepad_resource_to_double_integer(gamepad_data)
	int17_buttons_triggers = double_int[0]
	int18_joysticks = double_int[1]
	on_integer_to_relayed.emit(int17_buttons_triggers)
	on_integer_to_relayed.emit(int18_joysticks)

func relay_if_value_1817_changed():	
	var double_int :Array[int]= S2W_IntBinaryUtility.gamepad_resource_to_double_integer(gamepad_data)
	if int17_buttons_triggers !=double_int[0]:
		int17_buttons_triggers = double_int[0]
		on_integer_to_relayed.emit(int17_buttons_triggers)
	if int18_joysticks !=double_int[1]:
		int18_joysticks = double_int[1]
		on_integer_to_relayed.emit(int18_joysticks)

func _ready() -> void:
	force_relay_state_as_int1817()


func _process(delta: float) -> void:
	if use_frame_check:
		relay_if_value_1817_changed()


###### BUTTON ABYX SETTERS ###
func press_a():
	gamepad_data.button_a_down = true
	relay_if_value_1817_changed()

func release_a():
	gamepad_data.button_a_down = false
	relay_if_value_1817_changed()

func press_b():
	gamepad_data.button_b_right = true
	relay_if_value_1817_changed()
func release_b():
	gamepad_data.button_b_right = false
	relay_if_value_1817_changed()
func press_x():
	gamepad_data.button_x_left = true
	relay_if_value_1817_changed()
func release_x():
	gamepad_data.button_x_left = false
	relay_if_value_1817_changed()
func press_y():
	gamepad_data.button_y_up = true
	relay_if_value_1817_changed()
func release_y():
	gamepad_data.button_y_up = false
	relay_if_value_1817_changed()

func set_a(pressed:bool):
	gamepad_data.button_a_down = pressed
	relay_if_value_1817_changed()
func set_b(pressed:bool):
	gamepad_data.button_b_right = pressed
	relay_if_value_1817_changed()
func set_x(pressed:bool):
	gamepad_data.button_x_left = pressed
	relay_if_value_1817_changed()
func set_y(pressed:bool):
	gamepad_data.button_y_up = pressed
	relay_if_value_1817_changed()


#### ARROW BUTTON SETTERS ###
func press_arrow_up():
	gamepad_data.arrow_up = true
	relay_if_value_1817_changed()
func release_arrow_up():
	gamepad_data.arrow_up = false
	relay_if_value_1817_changed()
func press_arrow_down():
	gamepad_data.arrow_down = true
	relay_if_value_1817_changed()
func release_arrow_down():
	gamepad_data.arrow_down = false
	relay_if_value_1817_changed()
func press_arrow_left():
	gamepad_data.arrow_left = true
	relay_if_value_1817_changed()
func release_arrow_left():
	gamepad_data.arrow_left = false
	relay_if_value_1817_changed()
func press_arrow_right():
	gamepad_data.arrow_right = true
	relay_if_value_1817_changed()
func release_arrow_right():
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()

	
func set_arrow_up(pressed:bool):
	gamepad_data.arrow_up = pressed
	relay_if_value_1817_changed()
func set_arrow_down(pressed:bool):
	gamepad_data.arrow_down = pressed
	relay_if_value_1817_changed()
func set_arrow_left(pressed:bool):
	gamepad_data.arrow_left = pressed
	relay_if_value_1817_changed()
func set_arrow_right(pressed:bool):
	gamepad_data.arrow_right = pressed
	relay_if_value_1817_changed()

func set_arrows_direction_north():
	gamepad_data.arrow_up = true
	gamepad_data.arrow_down = false
	gamepad_data.arrow_left = false
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()
func set_arrows_direction_north_east():
	gamepad_data.arrow_up = true
	gamepad_data.arrow_down = false
	gamepad_data.arrow_left = false
	gamepad_data.arrow_right = true
	relay_if_value_1817_changed()
func set_arrows_direction_east():
	gamepad_data.arrow_up = false
	gamepad_data.arrow_down = false
	gamepad_data.arrow_left = false
	gamepad_data.arrow_right = true
	relay_if_value_1817_changed()
func set_arrows_direction_south_east():
	gamepad_data.arrow_up = false
	gamepad_data.arrow_down = true
	gamepad_data.arrow_left = false
	gamepad_data.arrow_right = true
	relay_if_value_1817_changed()
func set_arrows_direction_south():
	gamepad_data.arrow_up = false
	gamepad_data.arrow_down = true			
	gamepad_data.arrow_left = false
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()
func set_arrows_direction_south_west():
	gamepad_data.arrow_up = false
	gamepad_data.arrow_down = true			
	gamepad_data.arrow_left = true
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()
func set_arrows_direction_west():
	gamepad_data.arrow_up = false
	gamepad_data.arrow_down = false
	gamepad_data.arrow_left = true
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()

func set_arrows_direction_north_west():
	gamepad_data.arrow_up = true
	gamepad_data.arrow_down = false
	gamepad_data.arrow_left = true
	gamepad_data.arrow_right = false
	relay_if_value_1817_changed()

##### MENU BUTTON SETTERS ###

func press_menu_left():
	gamepad_data.menu_left = true
	relay_if_value_1817_changed()
func release_menu_left():
	gamepad_data.menu_left = false
	relay_if_value_1817_changed()
func press_menu_right():
	gamepad_data.menu_right = true
	relay_if_value_1817_changed()
func release_menu_right():
	gamepad_data.menu_right = false
	relay_if_value_1817_changed()
func press_menu_center():
	gamepad_data.menu_center = true
	relay_if_value_1817_changed()
func release_menu_center():
	gamepad_data.menu_center = false
	relay_if_value_1817_changed()
func set_menu_left(pressed:bool):
	gamepad_data.menu_left = pressed
	relay_if_value_1817_changed()
func set_menu_right(pressed:bool):
	gamepad_data.menu_right = pressed
	relay_if_value_1817_changed()
func set_menu_center(pressed:bool):
	gamepad_data.menu_center = pressed
	relay_if_value_1817_changed()


#### Side BUTTON SETTERS ###
func press_side_left():
	gamepad_data.side_button_left = true
	relay_if_value_1817_changed()
func release_side_left():
	gamepad_data.side_button_left = false
	relay_if_value_1817_changed()

func press_side_right():
	gamepad_data.side_button_right = true
	relay_if_value_1817_changed()
func release_side_right():
	gamepad_data.side_button_right = false
	relay_if_value_1817_changed()

func set_side_left(pressed:bool):
	gamepad_data.side_button_left = pressed
	relay_if_value_1817_changed()

func set_side_right(pressed:bool):
	gamepad_data.side_button_right = pressed
	relay_if_value_1817_changed()

#### JOYSTICK BUTTON SETTERS ###
func press_stick_left():
	gamepad_data.stick_joystick_left = true
	relay_if_value_1817_changed()
func release_stick_left():
	gamepad_data.stick_joystick_left = false
	relay_if_value_1817_changed()

func press_stick_right():
	gamepad_data.stick_joystick_right = true
	relay_if_value_1817_changed()
func release_stick_right():
	gamepad_data.stick_joystick_right = false
	relay_if_value_1817_changed()

func set_stick_left(pressed:bool):
	gamepad_data.stick_joystick_left = pressed
	relay_if_value_1817_changed()
func set_stick_right(pressed:bool):
	gamepad_data.stick_joystick_right = pressed
	relay_if_value_1817_changed()



##### JOYSTICK SETTERS ###

func set_left_joystick_x_horizontal(x_percent:float):
	gamepad_data.joystick_left_horizontal_axis_n1_p1_percent = x_percent
	relay_if_value_1817_changed()
func set_left_joystick_y_vertical(y_percent:float):
	gamepad_data.joystick_left_vertical_axis_n1_p1_percent = y_percent
	relay_if_value_1817_changed()
func set_right_joystick_x_horizontal(x_percent:float):
	gamepad_data.joystick_right_horizontal_axis_n1_p1_percent = x_percent
	relay_if_value_1817_changed()
func set_right_joystick_y_vertical(y_percent:float):
	gamepad_data.joystick_right_vertical_axis_n1_p1_percent = y_percent
	relay_if_value_1817_changed()	


func set_left_joystick_with_vector2(vec:Vector2):
	gamepad_data.joystick_left_horizontal_axis_n1_p1_percent = vec.x
	gamepad_data.joystick_left_vertical_axis_n1_p1_percent = vec.y
	relay_if_value_1817_changed()

func set_right_joystick_with_vector2(vec:Vector2):
	gamepad_data.joystick_right_horizontal_axis_n1_p1_percent = vec.x
	gamepad_data.joystick_right_vertical_axis_n1_p1_percent = vec.y
	relay_if_value_1817_changed()

func set_left_joystick(x_percent:float,y_percent:float):
	gamepad_data.joystick_left_horizontal_axis_n1_p1_percent = x_percent
	gamepad_data.joystick_left_vertical_axis_n1_p1_percent = y_percent
	relay_if_value_1817_changed()

func set_right_joystick(x_percent:float,y_percent:float):
	gamepad_data.joystick_right_horizontal_axis_n1_p1_percent = x_percent
	gamepad_data.joystick_right_vertical_axis_n1_p1_percent = y_percent
	relay_if_value_1817_changed()


### TRIGGER SETTERS ###
func set_left_trigger(percent:float):
	gamepad_data.trigger_left_axis_01_percent = percent
	relay_if_value_1817_changed()	

func set_right_trigger(percent:float):
	gamepad_data.trigger_right_axis_01_percent = percent
	relay_if_value_1817_changed()

func set_triggers(left_percent:float,right_percent:float):
	gamepad_data.trigger_left_axis_01_percent = left_percent
	gamepad_data.trigger_right_axis_01_percent = right_percent
	relay_if_value_1817_changed()

	
