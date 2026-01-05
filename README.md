```
git submodule add https://github.com/EloiStree/2025_12_04_gdp_s2w_int_utility.git addons/2025_12_04_gdp_s2w_int_utility
git submodule update --init --recursive
```


# 2025_12_04_gdp_s2w_int_utility
Utility box for converting the Scratch 2 Warcraft (S2W) format into an integer and back in Godot.


See also for multiplayer type:    
https://github.com/EloiStree/2025_11_21_gdp_int_s2w_input_multiplayer    




from the Arduino binary part
``` cpp


class IntAndBinaryUtility{

  public:
	static constexpr  int binary_tag= 1700000000 ;// 01100101010100111111000100000000
	
	static float turn_from_1_to_99_as_percent(int value){

	  if(value == 0) return 0.0;
	  // Turn 1 to 99 to -1.0 to 1.0
	  return float((double(value) - 50.0) / 49.0);
	}

		

	static bool is_integer_bit_right_to_left_true_using_binary_tag(int value, int index){
	  //01100101010100111111000100000000
	  bool in_binary_tag= (binary_tag & (1 << index)) ? true: false;
	  bool in_value = (value & (1 << index)) ? true: false;

	  if(in_binary_tag) return !in_value;
	  return in_value;
	}

	static bool is_integer_bit_right_to_left_true(int value, int index){
	  //Don't forget to remove the tag (like 1700000000)
      return (value & (1 << index)) ? true: false;
    }

    static void int_to_binary_buffer(int value, char* buffer, size_t buffer_size) {
        if (buffer_size < 32) {
            return; // Ensure buffer is large enough for 32 bits
        }
        for (int i = 0; i < 32; i++) {
			buffer[31 - i] = (value & (1 << i)) ? '1' : '0';
        }
		buffer[32] = '\0'; // Null-terminate the string
    }

    static void int_to_binary_buffer_less(int value, int less_value, char* buffer, size_t buffer_size) {
        if (buffer_size < 32) {
            return; // Ensure buffer is large enough for 32 bits
        }
        for (int i = 0; i < 32; i++) {
            bool inverse = (binary_tag & (1 << i));
			buffer[31 - i] = (value & (1 << i)) ? (inverse ? '0' : '1') : (inverse ? '1' : '0');
        }
		buffer[32] = '\0'; // Null-terminate the string
    }
};






class IIDUtility {
public:
  static int32_t byte_to_little_endian_int(byte b0, byte b1, byte b2, byte b3) {
    return ((int32_t)b0) | ((int32_t)b1 << 8) | ((int32_t)b2 << 16) | ((int32_t)b3 << 24);
  }

  static uint64_t bytes_to_little_endian_uint64(byte b0, byte b1, byte b2, byte b3, byte b4, byte b5, byte b6, byte b7) {
    return ((uint64_t)b0) | ((uint64_t)b1 << 8) | ((uint64_t)b2 << 16) | ((uint64_t)b3 << 24) | ((uint64_t)b4 << 32) | ((uint64_t)b5 << 40) | ((uint64_t)b6 << 48) | ((uint64_t)b7 << 56);
  }

  static void little_endian_int_to_bytes(int32_t value, uint8_t bytes[4]) {
    bytes[0] = value & 0xFF;
    bytes[1] = (value >> 8) & 0xFF;
    bytes[2] = (value >> 16) & 0xFF;
    bytes[3] = (value >> 24) & 0xFF;
  }

  static void little_endian_uint64_to_bytes(uint64_t value, uint8_t bytes[8]) {
    bytes[0] = value & 0xFF;
    bytes[1] = (value >> 8) & 0xFF;
    bytes[2] = (value >> 16) & 0xFF;
    bytes[3] = (value >> 24) & 0xFF;
    bytes[4] = (value >> 32) & 0xFF;
    bytes[5] = (value >> 40) & 0xFF;
    bytes[6] = (value >> 48) & 0xFF;
    bytes[7] = (value >> 56) & 0xFF;
  }
};

/// @brief Allows to switch off print when code is ready.
class DebugPrintStatic {
public:
  static void debug_print(String text) {
    if (m_use_print_debug)
      Serial.print(text);
  }
  static void debug_println(String text) {
    if (m_use_print_debug)
      Serial.println(text);
  }

  static bool is_using_debug_print() {
    return m_use_print_debug;
  }
  static bool m_use_print_debug;
};

bool DebugPrintStatic::m_use_print_debug = true;



else if(value>=1800000000 && value<=1899999999){

      //18 50 20 00 10
      //1850200010
      //4 bytes because integer
      int left_horizontal_from_1_to_99 =   (value/1000000)%100;
      int left_vertical_from_1_to_99 =     (value/10000)%100;
      int right_horizontal_from_1_to_99 =  (value/100)%100;
      int right_vertical_from_1_to_99 =    (value/1)%100;
      float left_horizontal_percent= IntAndBinaryUtility::turn_from_1_to_99_as_percent(left_horizontal_from_1_to_99);
      float left_vertical_percent= IntAndBinaryUtility::turn_from_1_to_99_as_percent(left_vertical_from_1_to_99);
      float right_horizontal_percent= IntAndBinaryUtility::turn_from_1_to_99_as_percent(right_horizontal_from_1_to_99);
      float right_vertical_percent= IntAndBinaryUtility::turn_from_1_to_99_as_percent(right_vertical_from_1_to_99);
      gamepad()->set_left_horizontal_percent(left_horizontal_percent);
      gamepad()->set_left_vertical_percent(left_vertical_percent);
      gamepad()->set_right_horizontal_percent(right_horizontal_percent);
      gamepad()->set_right_vertical_percent(right_vertical_percent );
    }
    else if(value>=1700000000 && value<=1799999999){
            m_binaryBufferOfInteger[33]; // Buffer to store the binary representation (32 bits + null terminator)
            //IntAndBinaryUtility::int_to_binary_buffer(value, m_binaryBufferOfInteger, 33);
            //Serial.println(m_binaryBufferOfInteger);
            value=value-1700000000;
            IntAndBinaryUtility::int_to_binary_buffer(value,m_binaryBufferOfInteger,33);
            //Serial.println(m_binaryBufferOfInteger);


            float triggerLeft=0.0;
            float triggerRight=0.0;
            float arrowHorizontal=0;
            float arrowVertical =0;
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 0))
            gamepad()->press_a(true);
            else gamepad()->press_a(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 1)) gamepad()->press_x(true);
            else gamepad()->press_x(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 2)) gamepad()->press_b(true);
            else gamepad()->press_b(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 3)) gamepad()->press_y(true);
            else gamepad()->press_y(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 4)) gamepad()->press_left_side_button(true);
            else gamepad()->press_left_side_button(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 5)) gamepad()->press_right_side_button(true);
            else gamepad()->press_right_side_button(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 6)) gamepad()->press_left_stick(true);
            else gamepad()->press_left_stick(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 7)) gamepad()->press_right_stick(true);
            else gamepad()->press_right_stick(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 8)) gamepad()->press_menu_left(true);
            else gamepad()->press_menu_left(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 9)) gamepad()->press_menu_right(true);
            else gamepad()->press_menu_right(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 10)) gamepad()->press_home_xbox_button(true);
            else gamepad()->press_home_xbox_button(false);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 11)) arrowVertical+=1; // CLOCK WISE N
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 12)) arrowHorizontal+=1; // CLOCK WISE E
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 13)) arrowVertical+=-1; // CLOCK WISE S
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 14)) arrowHorizontal+=-1; //// CLOCK WISE W

            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 18)) triggerLeft+=(0.25);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 19)) triggerLeft+=(0.25);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 20)) triggerLeft+=(0.5);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 21)) triggerRight+=(0.25);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 22)) triggerRight+=(0.25);
            if(IntAndBinaryUtility::is_integer_bit_right_to_left_true (value, 23)) triggerRight+=(0.5);
            gamepad()->set_trigger_left_percent(triggerLeft);
            gamepad()->set_trigger_right_percent(triggerRight);

            if(arrowVertical==1 && arrowHorizontal==0)
                 gamepad()->press_arrow_n();
            else if(arrowVertical==1 && arrowHorizontal==1)
                gamepad()->press_arrow_ne();
            else if(arrowVertical==0 && arrowHorizontal==1)
                gamepad()->press_arrow_e();
            else if(arrowVertical==-1 && arrowHorizontal==1)
                gamepad()->press_arrow_se();
            else if(arrowVertical==-1 && arrowHorizontal==0)
                gamepad()->press_arrow_s();
            else if(arrowVertical==-1 && arrowHorizontal==-1)
                gamepad()->press_arrow_sw();
            else if(arrowVertical==0 && arrowHorizontal==-1)
                gamepad()->press_arrow_w();
            else if(arrowVertical==1 && arrowHorizontal==-1)
                gamepad()->press_arrow_nw();
            else
                gamepad()->release_dpad();
            bool useDebugPrint = false;
          // if(useDebugPrint){
          //   Serial.print(" A:");
          //   Serial.print(isIntegerBitRightToLeftTrue(value, 0));
          //   Serial.print(" X:");
          //   Serial.print(isIntegerBitRightToLeftTrue(value, 1));
          //   Serial.print(" B:");
          //   Serial.print(isIntegerBitRightToLeftTrue(value, 2));
          //   Serial.print(" Y:");
          //   Serial.print(isIntegerBitRightToLeftTrue(value, 3));
          //     Serial.print(" LB:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 4));
          //     Serial.print(" RB:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 5));
          //     Serial.print(" LS:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 6));
          //     Serial.print(" RS:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 7));
          //     Serial.print(" MENU:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 8));
          //     Serial.print(" HOME:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 9));
          //     Serial.print(" DPad N:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 10));
          //     Serial.print(" DPad NE:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 11));
          //     Serial.print(" DPad E:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 12));
          //     Serial.print(" DPad SE:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 13));
          //     Serial.print(" DPad S:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 14));
          //     Serial.print(" DPad SW:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 15));
          //     Serial.print(" DPad W:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 16));
          //     Serial.print(" DPad NW:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 17));
          //     Serial.print(" Left Trigger 0.25 1:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 18));
          //     Serial.print(" Left Trigger 0.25 2:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 19));
          //     Serial.print(" Left Trigger 0.5 3 :");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 20));
          //     Serial.print(" Right Trigger 0.25 1:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 21));
          //     Serial.print(" Right Trigger 0.25 2:");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 22));
          //     Serial.print(" Right Trigger 0.5 3 :");
          //     Serial.print(isIntegerBitRightToLeftTrue(value, 23));
          //     Serial.println();
          // }
            //1715243245
            //11111111 11111111 11111111 11111111
            /*
            00 bit 1 0
            byte 11111111  255
            signe byte 01111111 -127 127
            float integer -1.0 ,1.0
            11111111 11111111 11111111 11111111
            deux bytes (short)
            11111111 11011111 65535
            11111111 * 20 * 100000000000
            2 bytes 2 char
            BD BR BU BL  JD JR BTL BTR  ML MC MR AD AR AU AL
            0  0  0  0   0  0  0   0    0  0  0  0  0  0  0
            jlv jlh jrv jrh tl tr
            9   9   9   9   9  9
            */
          }
      }



```
