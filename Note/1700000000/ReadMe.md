
This one is a bit tricky.
The idea is to store the gamepad button as 1 and 0 in a single integer  of 4 bytes.
17 is used to notify that the reste is under this standard.

Now we need to store it in this format (in Godot, Unity and Python) to be read by the Hardware or python Key simulator.
Most likely XOMI or an Arduino XInput/ ESP32

The tricky part is that int storage is store a 4 bytes as little endian or big endiant.
But we dont care, what we want is the litteral definition of a integer.

000001 = 1
000011 = 3
01100101010100111111000100000000 =1700000000

The trigger are not something that most game use with precision.
So you could use 0 0.2 0.5 0.75 1  (until you really need precision)

C# version
https://github.com/EloiStree/OpenUPM_PushGenericIID/blob/main/Runtime/STRUCT/Gamepad/GamepadId2020Extra.cs
https://github.com/EloiStree/OpenUPM_PushGenericIID/blob/main/Runtime/PushMono/IntegerToGamepad2020Utility.cs

The idea here is to store as 
``` cpp
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
