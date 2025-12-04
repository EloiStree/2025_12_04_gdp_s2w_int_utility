class_name S2W_Data_Gamepad1817 
extends Resource
	
@export_group("Primitive State")
@export var button_y_up:bool
@export var button_b_right:bool
@export var button_a_down:bool
@export var button_x_left:bool

@export var arrow_up:bool
@export var arrow_right:bool
@export var arrow_down:bool
@export var arrow_left:bool

@export var side_button_left:bool
@export var side_button_right:bool

@export var stick_joystick_left:bool
@export var stick_joystick_right:bool

@export var menu_left:bool
@export var menu_right:bool
@export var menu_center:bool


@export var joystick_left_horizontal_axis_n1_p1_percent:float
@export var joystick_left_vertical_axis_n1_p1_percent:float
@export var joystick_right_horizontal_axis_n1_p1_percent:float
@export var joystick_right_vertical_axis_n1_p1_percent:float

@export var trigger_left_axis_01_percent:float
@export var trigger_right_axis_01_percent:float


@export_group("Raw State")
@export var int_1800000000:int
@export var int_1700000000:int
@export var int_1800000000_bytes_little_endian:PackedByteArray
@export var int_1700000000_bytes_little_endian:PackedByteArray
@export var binary_1800000000:String
@export var binary_1700000000:String


func update_raw_state_from_primitive():
		return 

		
	
