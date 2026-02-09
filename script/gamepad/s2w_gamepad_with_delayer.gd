

	



### https://github.com/EloiStree/S2W for the integer convention.
class_name S2WGamepadWithDelayer
extends Node

signal on_integer_action(value: int)
signal on_integer_action_to_delay_in_milliseconds(value: int, milliseconds_to_delay: int)


const BUTTON_A_DOWN = 1300
const BUTTON_X_LEFT = 1301
const BUTTON_B_RIGHT = 1302
const BUTTON_Y_UP = 1303
const BUTTON_LEFT_SIDE = 1304
const BUTTON_RIGHT_SIDE = 1305
const BUTTON_LEFT_STICK = 1306
const BUTTON_RIGHT_STICK = 1307
const BUTTON_MENU_RIGHT = 1308
const BUTTON_MENU_LEFT = 1309

const ARROW_RELEASE = 1310
const ARROW_UP = 1311
const ARROW_UP_RIGHT = 1312
const ARROW_RIGHT = 1313
const ARROW_DOWN_RIGHT = 1314
const ARROW_DOWN = 1315
const ARROW_DOWN_LEFT = 1316
const ARROW_LEFT = 1317
const ARROW_UP_LEFT = 1318

const XBOX_HOME_BUTTON = 1319
const RANDOM_AXIS = 1320
const START_RECORDING = 1321

const LEFT_STICK_NEUTRAL = 1330
const LEFT_STICK_UP = 1331
const LEFT_STICK_UP_RIGHT = 1332
const LEFT_STICK_RIGHT = 1333
const LEFT_STICK_DOWN_RIGHT = 1334
const LEFT_STICK_DOWN = 1335
const LEFT_STICK_DOWN_LEFT = 1336
const LEFT_STICK_LEFT = 1337
const LEFT_STICK_UP_LEFT = 1338

const RIGHT_STICK_NEUTRAL = 1340
const RIGHT_STICK_UP = 1341
const RIGHT_STICK_UP_RIGHT = 1342
const RIGHT_STICK_RIGHT = 1343
const RIGHT_STICK_DOWN_RIGHT = 1344
const RIGHT_STICK_DOWN = 1345
const RIGHT_STICK_DOWN_LEFT = 1346
const RIGHT_STICK_LEFT = 1347
const RIGHT_STICK_UP_LEFT = 1348

const LEFT_TRIGGER_100 = 1358
const RIGHT_TRIGGER_100 = 1359
const LEFT_TRIGGER_75 = 1368
const RIGHT_TRIGGER_75 = 1369
const LEFT_TRIGGER_50 = 1378
const RIGHT_TRIGGER_50 = 1379
const LEFT_TRIGGER_25 = 1388
const RIGHT_TRIGGER_25 = 1389

const RELEASE_ALL_TOUCH = 1390
const RELEASE_ALL_TOUCH_BUT_MENU = 1391
const CLEAR_TIMED_COMMAND = 1398




# -------------------
# GENERIC METHODS
# -------------------

func push_integer_action(value: int) -> void:
	on_integer_action.emit( value)

func push_integer_action_with_milliseconds_delay(value: int, milliseconds: int) -> void:
	on_integer_action_to_delay_in_milliseconds.emit( value, milliseconds)

func push_integer_action_with_seconds_delay(value: int, seconds: float) -> void:
	var ms := roundi(seconds * 1000.0)
	on_integer_action_to_delay_in_milliseconds.emit( value, ms)

func press_key(value: int) -> void:
	on_integer_action.emit( value)

func release_key(value: int) -> void:
	on_integer_action.emit( value + 1000)

func stroke_key_no_delay(key: int) -> void:
	press_key(key)
	release_key(key)

func press_key_in_milliseconds(value: int, milliseconds: int) -> void:
	on_integer_action_to_delay_in_milliseconds.emit( value, milliseconds)

func press_key_in_seconds(value: int, seconds: float) -> void:
	var ms := roundi(seconds * 1000.0)
	on_integer_action_to_delay_in_milliseconds.emit( value, ms)

func release_key_in_milliseconds(value: int, milliseconds: int) -> void:
	on_integer_action_to_delay_in_milliseconds.emit( value + 1000, milliseconds)

func release_key_in_seconds(value: int, seconds: float) -> void:
	var ms := roundi(seconds * 1000.0)
	on_integer_action_to_delay_in_milliseconds.emit( value + 1000, ms)

func stroke_key_in_milliseconds(key: int, delay_ms: int, press_duration_ms: int) -> void:
	press_key_in_milliseconds(key, press_duration_ms)
	release_key_in_milliseconds(key, delay_ms + press_duration_ms)

func stroke_key_in_seconds(key: int, delay_s: float, press_duration_s: float) -> void:
	var delay_ms := roundi(delay_s * 1000.0)
	var press_ms := roundi(press_duration_s * 1000.0)
	press_key_in_milliseconds(key, press_ms)
	release_key_in_milliseconds(key, delay_ms + press_ms)

func stroke_key_for_milliseconds(key: int, press_duration_ms: int) -> void:
	press_key(key)
	release_key_in_milliseconds(key, press_duration_ms)

func stroke_key_for_seconds(key: int, press_duration_s: float) -> void:
	var press_ms := roundi(press_duration_s * 1000.0)
	press_key(key)
	release_key_in_milliseconds(key, press_ms)

func several_click(
	key: int,
	number_of_clicks: int,
	delay_between_clicks_ms: int,
	press_duration_ms: int
) -> void:
	var time_relative := 0
	for i in number_of_clicks:
		press_key_in_milliseconds(key, time_relative)
		time_relative += press_duration_ms
		release_key_in_milliseconds(key, time_relative)
		time_relative += delay_between_clicks_ms

func double_click(key: int, delay_between_clicks_ms: int, press_duration_ms: int) -> void:
	several_click(key, 2, delay_between_clicks_ms, press_duration_ms)

func triple_click(key: int, delay_between_clicks_ms: int, press_duration_ms: int) -> void:
	several_click(key, 3, delay_between_clicks_ms, press_duration_ms)

func push_enum_integer_action(value: XboxIntegerActionS2W) -> void:
	push_integer_action( int(value))

func push_enum_integer_action_with_milliseconds_delay(value: XboxIntegerActionS2W, milliseconds: int) -> void:
	push_integer_action_with_milliseconds_delay( int(value), milliseconds)

func push_enum_integer_action_with_seconds_delay(value: XboxIntegerActionS2W, seconds: float) -> void:
	push_integer_action_with_seconds_delay( int(value), seconds)

func press_enum_key(value: XboxIntegerActionS2W) -> void:
	press_key( int(value))

func release_enum_key(value: XboxIntegerActionS2W) -> void:
	release_key( int(value))

func stroke_enum_key_no_delay(key: XboxIntegerActionS2W) -> void:
	stroke_key_no_delay( int(key))

func press_enum_key_in_milliseconds(value: XboxIntegerActionS2W, milliseconds: int) -> void:
	press_key_in_milliseconds( int(value), milliseconds)

func press_enum_key_in_seconds(value: XboxIntegerActionS2W, seconds: float) -> void:
	press_key_in_seconds( int(value), seconds)

func release_enum_key_in_milliseconds(value: XboxIntegerActionS2W, milliseconds: int) -> void:
	release_key_in_milliseconds( int(value), milliseconds)

func release_enum_key_in_seconds(value: XboxIntegerActionS2W, seconds: float) -> void:
	release_key_in_seconds( int(value), seconds)

func stroke_enum_key_in_milliseconds(key: XboxIntegerActionS2W, delay_ms: int, press_duration_ms: int) -> void:
	stroke_key_in_milliseconds( int(key), delay_ms, press_duration_ms)

func stroke_enum_key_in_seconds(key: XboxIntegerActionS2W, delay_s: float, press_duration_s: float) -> void:
	stroke_key_in_seconds( int(key), delay_s, press_duration_s)

func stroke_enum_key_for_milliseconds(key: XboxIntegerActionS2W, press_duration_ms: int) -> void:
	stroke_key_for_milliseconds( int(key), press_duration_ms)

func stroke_enum_key_for_seconds(key: XboxIntegerActionS2W, press_duration_s: float) -> void:
	stroke_key_for_seconds( int(key), press_duration_s)

func several_enum_click(
	key: XboxIntegerActionS2W,
	number_of_clicks: int,
	delay_between_clicks_ms: int,
	press_duration_ms: int
) -> void:
	several_click( int(key), number_of_clicks, delay_between_clicks_ms, press_duration_ms)

func double_enum_click(key: XboxIntegerActionS2W, delay_between_clicks_ms: int, press_duration_ms: int) -> void:
	double_click( int(key), delay_between_clicks_ms, press_duration_ms)

func triple_enum_click(key: XboxIntegerActionS2W, delay_between_clicks_ms: int, press_duration_ms: int) -> void:
	triple_click( int(key), delay_between_clicks_ms, press_duration_ms)





enum XboxIntegerActionS2W {
	# BUTTONS
	BUTTON_A_DOWN = 1300,
	BUTTON_X_LEFT = 1301,
	BUTTON_B_RIGHT = 1302,
	BUTTON_Y_UP = 1303,
	BUTTON_LEFT_SIDE = 1304,
	BUTTON_RIGHT_SIDE = 1305,
	BUTTON_LEFT_STICK = 1306,
	BUTTON_RIGHT_STICK = 1307,
	BUTTON_MENU_RIGHT = 1308,
	BUTTON_MENU_LEFT = 1309,

	# DPAD
	ARROW_RELEASE = 1310,
	ARROW_UP = 1311,
	ARROW_UP_RIGHT = 1312,
	ARROW_RIGHT = 1313,
	ARROW_DOWN_RIGHT = 1314,
	ARROW_DOWN = 1315,
	ARROW_DOWN_LEFT = 1316,
	ARROW_LEFT = 1317,
	ARROW_UP_LEFT = 1318,

	# SYSTEM
	XBOX_HOME_BUTTON = 1319,
	RANDOM_AXIS = 1320,
	START_RECORDING = 1321,

	# LEFT STICK DIRECTIONS
	LEFT_STICK_NEUTRAL = 1330,
	LEFT_STICK_UP = 1331,
	LEFT_STICK_UP_RIGHT = 1332,
	LEFT_STICK_RIGHT = 1333,
	LEFT_STICK_DOWN_RIGHT = 1334,
	LEFT_STICK_DOWN = 1335,
	LEFT_STICK_DOWN_LEFT = 1336,
	LEFT_STICK_LEFT = 1337,
	LEFT_STICK_UP_LEFT = 1338,

	# RIGHT STICK DIRECTIONS
	RIGHT_STICK_NEUTRAL = 1340,
	RIGHT_STICK_UP = 1341,
	RIGHT_STICK_UP_RIGHT = 1342,
	RIGHT_STICK_RIGHT = 1343,
	RIGHT_STICK_DOWN_RIGHT = 1344,
	RIGHT_STICK_DOWN = 1345,
	RIGHT_STICK_DOWN_LEFT = 1346,
	RIGHT_STICK_LEFT = 1347,
	RIGHT_STICK_UP_LEFT = 1348,

	# TRIGGERS
	LEFT_TRIGGER_100 = 1358,
	RIGHT_TRIGGER_100 = 1359,
	LEFT_TRIGGER_75 = 1368,
	RIGHT_TRIGGER_75 = 1369,
	LEFT_TRIGGER_50 = 1378,
	RIGHT_TRIGGER_50 = 1379,
	LEFT_TRIGGER_25 = 1388,
	RIGHT_TRIGGER_25 = 1389,

	# AXES 100%
	LEFT_STICK_HORIZONTAL_P100 = 1350,
	LEFT_STICK_HORIZONTAL_N100 = 1351,
	LEFT_STICK_VERTICAL_P100 = 1352,
	LEFT_STICK_VERTICAL_N100 = 1353,
	RIGHT_STICK_HORIZONTAL_P100 = 1354,
	RIGHT_STICK_HORIZONTAL_N100 = 1355,
	RIGHT_STICK_VERTICAL_P100 = 1356,
	RIGHT_STICK_VERTICAL_N100 = 1357,

	# AXES 75%
	LEFT_STICK_HORIZONTAL_P75 = 1360,
	LEFT_STICK_HORIZONTAL_N75 = 1361,
	LEFT_STICK_VERTICAL_P75 = 1362,
	LEFT_STICK_VERTICAL_N75 = 1363,
	RIGHT_STICK_HORIZONTAL_P75 = 1364,
	RIGHT_STICK_HORIZONTAL_N75 = 1365,
	RIGHT_STICK_VERTICAL_P75 = 1366,
	RIGHT_STICK_VERTICAL_N75 = 1367,

	# AXES 50%
	LEFT_STICK_HORIZONTAL_P50 = 1370,
	LEFT_STICK_HORIZONTAL_N50 = 1371,
	LEFT_STICK_VERTICAL_P50 = 1372,
	LEFT_STICK_VERTICAL_N50 = 1373,
	RIGHT_STICK_HORIZONTAL_P50 = 1374,
	RIGHT_STICK_HORIZONTAL_N50 = 1375,
	RIGHT_STICK_VERTICAL_P50 = 1376,
	RIGHT_STICK_VERTICAL_N50 = 1377,

	# AXES 25%
	LEFT_STICK_HORIZONTAL_P25 = 1380,
	LEFT_STICK_HORIZONTAL_N25 = 1381,
	LEFT_STICK_VERTICAL_P25 = 1382,
	LEFT_STICK_VERTICAL_N25 = 1383,
	RIGHT_STICK_HORIZONTAL_P25 = 1384,
	RIGHT_STICK_HORIZONTAL_N25 = 1385,
	RIGHT_STICK_VERTICAL_P25 = 1386,
	RIGHT_STICK_VERTICAL_N25 = 1387,

	# MISC
	RELEASE_ALL_TOUCH = 1390,
	RELEASE_ALL_TOUCH_BUT_MENU = 1391,
	CLEAR_TIMED_COMMAND = 1398
}
