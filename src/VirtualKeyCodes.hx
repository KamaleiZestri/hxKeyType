package;

// https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
enum abstract VKey(Int)
{
    public function toInt():Int
    {
        return this;
    }

    public static function fromInt(val:Int)
    {
        return cast(val,VKey);
    }

    private static function isLowercaseLetter(char:Int)
    {
        if (char <= 0x7A && char >= 0x61)
            return true;
        else 
            return false;
    }

    private static function isUppercaseLetter(char:Int)
    {
        if (char <= 0x5A && char >=0x41)
            return true;
        else 
            return false;
    }

    public static function fromUnicode(unicodeChar:Int): VKey
    {
        switch unicodeChar
        {
            case 10: return VK_RETURN;
            case "~".code: return VK_OEM_3;
            case "`".code: return VK_OEM_3;
            // TODO double for all
            case "!".code: return VK_1;
            case "@".code: return VK_2;
            case "#".code: return VK_3;
            case "$".code: return VK_4;
            case "%".code: return VK_5;
            case "^".code: return VK_6;
            case "&".code: return VK_7;
            case "*".code: return VK_8;
            case "(".code: return VK_9;
            case ")".code: return VK_0;
            case "_".code: return VK_OEM_MINUS;
            case "-".code: return VK_OEM_MINUS;
            case "=".code: return VK_OEM_PLUS;
            case "+".code: return VK_OEM_PLUS;
            case "\\".code: return VK_OEM_5;
            case "|".code: return VK_OEM_5;
            case "{".code: return VK_OEM_4;
            case "[".code: return VK_OEM_4;
            case "}".code: return VK_OEM_6;
            case "]".code: return VK_OEM_6;
            case ":".code: return VK_OEM_1;
            case ";".code: return VK_OEM_1;
            case "\"".code: return VK_OEM_7;
            case "'".code: return VK_OEM_7;
            case "<".code: return VK_OEM_COMMA;
            case ",".code: return VK_OEM_COMMA;
            case ">".code: return VK_OEM_PERIOD;
            case ".".code: return VK_OEM_PERIOD;
            case "?".code: return VK_OEM_2;
            case "/".code: return VK_OEM_2;
            
            case isLowercaseLetter(_) => true: return VKey.fromInt(unicodeChar - 32);

            default: return VKey.fromInt(unicodeChar);
        }
    }

    public static function getModifier(unicodeChar:Int): VKey
    {
        switch unicodeChar
        {
            case isUppercaseLetter(_) => true: return VK_SHIFT;
            case "~".code: return VK_SHIFT;
            case "!".code: return VK_SHIFT;
            case "@".code: return VK_SHIFT;
            case "#".code: return VK_SHIFT;
            case "$".code: return VK_SHIFT;
            case "%".code: return VK_SHIFT;
            case "^".code: return VK_SHIFT;
            case "&".code: return VK_SHIFT;
            case "*".code: return VK_SHIFT;
            case "(".code: return VK_SHIFT;
            case ")".code: return VK_SHIFT;
            case "_".code: return VK_SHIFT;
            case "+".code: return VK_SHIFT;
            case "\\".code: return VK_SHIFT;
            case "{".code: return VK_SHIFT;
            case "}".code: return VK_SHIFT;
            case ":".code: return VK_SHIFT;
            case "\"".code: return VK_SHIFT;
            case "<".code: return VK_SHIFT;
            case ">".code: return VK_SHIFT;
            case "?".code: return VK_SHIFT;
            
            default: return VKey.fromInt(0);
        }
    }

    var VK_NULL = 0x00; //press nothing

    var VK_LBUTTON = 0x01; //Left mouse button
    var VK_RBUTTON = 0x02; //Right mouse button
    var VK_CANCEL = 0x03; //Control-break processing
    var VK_MBUTTON = 0x04; //Middle mouse button
    var VK_XBUTTON1 = 0x05; //X1 mouse button
    var VK_XBUTTON2 = 0x06; //X2 mouse button

    var VK_BACK = 0x08; //Backspace key
    var VK_TAB = 0x09; //Tab key

    var VK_CLEAR = 0x0C; //Clear key
    var VK_RETURN = 0x0D; //Enter key

    var VK_SHIFT = 0x10; //Shift key
    var VK_CONTROL = 0x11; //Ctrl key
    var VK_MENU = 0x12; //Alt key
    var VK_PAUSE = 0x13; //Pause key
    var VK_CAPITAL = 0x14; //Caps lock key
    var VK_KANA = 0x15; //IME Kana mode
    var VK_HANGUL = 0x15; //IME Hangul mode
    var VK_IME_ON = 0x16; //IME On
    var VK_JUNJA = 0x17; //IME Junja mode
    var VK_FINAL = 0x18; //IME final mode
    var VK_HANJA = 0x19; //IME Hanja mode
    var VK_KANJI = 0x19; //IME Kanji mode
    var VK_IME_OFF = 0x1A; //IME Off
    var VK_ESCAPE = 0x1B; //Esc key
    var VK_CONVERT = 0x1C; //IME convert
    var VK_NONCONVERT = 0x1D; //IME nonconvert
    var VK_ACCEPT = 0x1E; //IME accept
    var VK_MODECHANGE = 0x1F; //IME mode change request
    var VK_SPACE = 0x20; //Spacebar key
    var VK_PRIOR = 0x21; //Page up key
    var VK_NEXT = 0x22; //Page down key
    var VK_END = 0x23; //End key
    var VK_HOME = 0x24; //Home key
    var VK_LEFT = 0x25; //Left arrow key
    var VK_UP = 0x26; //Up arrow key
    var VK_RIGHT = 0x27; //Right arrow key
    var VK_DOWN = 0x28; //Down arrow key
    var VK_SELECT = 0x29; //Select key
    var VK_PRINT = 0x2A; //Print key
    var VK_EXECUTE = 0x2B; //Execute key
    var VK_SNAPSHOT = 0x2C; //Print screen key
    var VK_INSERT = 0x2D; //Insert key
    var VK_DELETE = 0x2E; //Delete key
    var VK_HELP = 0x2F; //Help key
    var VK_0 = 0x30; //0 key
    var VK_1 = 0x31; //1 key
    var VK_2 = 0x32; //2 key
    var VK_3 = 0x33; //3 key
    var VK_4 = 0x34; //4 key
    var VK_5 = 0x35; //5 key
    var VK_6 = 0x36; //6 key
    var VK_7 = 0x37; //7 key
    var VK_8 = 0x38; //8 key
    var VK_9 = 0x39; //9 key

    var VK_A = 0x41; //A key
    var VK_B = 0x42; //B key
    var VK_C = 0x43; //C key
    var VK_D = 0x44; //D key
    var VK_E = 0x45; //E key
    var VK_F = 0x46; //F key
    var VK_G = 0x47; //G key
    var VK_H = 0x48; //H key
    var VK_I = 0x49; //I key
    var VK_J = 0x4A; //J key
    var VK_K = 0x4B; //K key
    var VK_L = 0x4C; //L key
    var VK_M = 0x4D; //M key
    var VK_N = 0x4E; //N key
    var VK_O = 0x4F; //O key
    var VK_P = 0x50; //P key
    var VK_Q = 0x51; //Q key
    var VK_R = 0x52; //R key
    var VK_S = 0x53; //S key
    var VK_T = 0x54; //T key
    var VK_U = 0x55; //U key
    var VK_V = 0x56; //V key
    var VK_W = 0x57; //W key
    var VK_X = 0x58; //X key
    var VK_Y = 0x59; //Y key
    var VK_Z = 0x5A; //Z key
    var VK_LWIN = 0x5B; //Left Windows logo key
    var VK_RWIN = 0x5C; //Right Windows logo key
    var VK_APPS = 0x5D; //Application key

    var VK_SLEEP = 0x5F; //Computer Sleep key
    var VK_NUMPAD0 = 0x60; //Numeric keypad 0 key
    var VK_NUMPAD1 = 0x61; //Numeric keypad 1 key
    var VK_NUMPAD2 = 0x62; //Numeric keypad 2 key
    var VK_NUMPAD3 = 0x63; //Numeric keypad 3 key
    var VK_NUMPAD4 = 0x64; //Numeric keypad 4 key
    var VK_NUMPAD5 = 0x65; //Numeric keypad 5 key
    var VK_NUMPAD6 = 0x66; //Numeric keypad 6 key
    var VK_NUMPAD7 = 0x67; //Numeric keypad 7 key
    var VK_NUMPAD8 = 0x68; //Numeric keypad 8 key
    var VK_NUMPAD9 = 0x69; //Numeric keypad 9 key
    var VK_MULTIPLY = 0x6A; //Multiply key
    var VK_ADD = 0x6B; //Add key
    var VK_SEPARATOR = 0x6C; //Separator key
    var VK_SUBTRACT = 0x6D; //Subtract key
    var VK_DECIMAL = 0x6E; //Decimal key
    var VK_DIVIDE = 0x6F; //Divide key
    var VK_F1 = 0x70; //F1 key
    var VK_F2 = 0x71; //F2 key
    var VK_F3 = 0x72; //F3 key
    var VK_F4 = 0x73; //F4 key
    var VK_F5 = 0x74; //F5 key
    var VK_F6 = 0x75; //F6 key
    var VK_F7 = 0x76; //F7 key
    var VK_F8 = 0x77; //F8 key
    var VK_F9 = 0x78; //F9 key
    var VK_F10 = 0x79; //F10 key
    var VK_F11 = 0x7A; //F11 key
    var VK_F12 = 0x7B; //F12 key
    var VK_F13 = 0x7C; //F13 key
    var VK_F14 = 0x7D; //F14 key
    var VK_F15 = 0x7E; //F15 key
    var VK_F16 = 0x7F; //F16 key
    var VK_F17 = 0x80; //F17 key
    var VK_F18 = 0x81; //F18 key
    var VK_F19 = 0x82; //F19 key
    var VK_F20 = 0x83; //F20 key
    var VK_F21 = 0x84; //F21 key
    var VK_F22 = 0x85; //F22 key
    var VK_F23 = 0x86; //F23 key
    var VK_F24 = 0x87; //F24 key

    var VK_NUMLOCK = 0x90; //Num lock key
    var VK_SCROLL = 0x91; //Scroll lock key

    var VK_LSHIFT = 0xA0; //Left Shift key
    var VK_RSHIFT = 0xA1; //Right Shift key
    var VK_LCONTROL = 0xA2; //Left Ctrl key
    var VK_RCONTROL = 0xA3; //Right Ctrl key
    var VK_LMENU = 0xA4; //Left Alt key
    var VK_RMENU = 0xA5; //Right Alt key
    var VK_BROWSER_BACK = 0xA6; //Browser Back key
    var VK_BROWSER_FORWARD = 0xA7; //Browser Forward key
    var VK_BROWSER_REFRESH = 0xA8; //Browser Refresh key
    var VK_BROWSER_STOP = 0xA9; //Browser Stop key
    var VK_BROWSER_SEARCH = 0xAA; //Browser Search key
    var VK_BROWSER_FAVORITES = 0xAB; //Browser Favorites key
    var VK_BROWSER_HOME = 0xAC; //Browser Start and Home key
    var VK_VOLUME_MUTE = 0xAD; //Volume Mute key
    var VK_VOLUME_DOWN = 0xAE; //Volume Down key
    var VK_VOLUME_UP = 0xAF; //Volume Up key
    var VK_MEDIA_NEXT_TRACK = 0xB0; //Next Track key
    var VK_MEDIA_PREV_TRACK = 0xB1; //Previous Track key
    var VK_MEDIA_STOP = 0xB2; //Stop Media key
    var VK_MEDIA_PLAY_PAUSE = 0xB3; //Play/Pause Media key
    var VK_LAUNCH_MAIL = 0xB4; //Start Mail key
    var VK_LAUNCH_MEDIA_SELECT = 0xB5; //Select Media key
    var VK_LAUNCH_APP1 = 0xB6; //Start Application 1 key
    var VK_LAUNCH_APP2 = 0xB7; //Start Application 2 key

    var VK_OEM_1 = 0xBA; //It can vary by keyboard. For the US ANSI keyboard , the Semiсolon and Colon key
    var VK_OEM_PLUS = 0xBB; //For any country/region, the Equals and Plus key
    var VK_OEM_COMMA = 0xBC; //For any country/region, the Comma and Less Than key
    var VK_OEM_MINUS = 0xBD; //For any country/region, the Dash and Underscore key
    var VK_OEM_PERIOD = 0xBE; //For any country/region, the Period and Greater Than key
    var VK_OEM_2 = 0xBF; //It can vary by keyboard. For the US ANSI keyboard, the Forward Slash and Question Mark    key
    var VK_OEM_3 = 0xC0; //It can vary by keyboard. For the US ANSI keyboard, the Grave Accent and Tilde key

    var VK_GAMEPAD_A = 0xC3; //Gamepad A button
    var VK_GAMEPAD_B = 0xC4; //Gamepad B button
    var VK_GAMEPAD_X = 0xC5; //Gamepad X button
    var VK_GAMEPAD_Y = 0xC6; //Gamepad Y button
    var VK_GAMEPAD_RIGHT_SHOULDER = 0xC7; //Gamepad Right Shoulder button
    var VK_GAMEPAD_LEFT_SHOULDER = 0xC8; //Gamepad Left Shoulder button
    var VK_GAMEPAD_LEFT_TRIGGER = 0xC9; //Gamepad Left Trigger button
    var VK_GAMEPAD_RIGHT_TRIGGER = 0xCA; //Gamepad Right Trigger button
    var VK_GAMEPAD_DPAD_UP = 0xCB; //Gamepad D-pad Up button
    var VK_GAMEPAD_DPAD_DOWN = 0xCC; //Gamepad D-pad Down button
    var VK_GAMEPAD_DPAD_LEFT = 0xCD; //Gamepad D-pad Left button
    var VK_GAMEPAD_DPAD_RIGHT = 0xCE; //Gamepad D-pad Right button
    var VK_GAMEPAD_MENU = 0xCF; //Gamepad Menu/Start button
    var VK_GAMEPAD_VIEW = 0xD0; //Gamepad View/Back button
    var VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON = 0xD1; //Gamepad Left Thumbstick button
    var VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON = 0xD2; //Gamepad Right Thumbstick button
    var VK_GAMEPAD_LEFT_THUMBSTICK_UP = 0xD3; //Gamepad Left Thumbstick up
    var VK_GAMEPAD_LEFT_THUMBSTICK_DOWN = 0xD4; //Gamepad Left Thumbstick down
    var VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT = 0xD5; //Gamepad Left Thumbstick right
    var VK_GAMEPAD_LEFT_THUMBSTICK_LEFT = 0xD6; //Gamepad Left Thumbstick left
    var VK_GAMEPAD_RIGHT_THUMBSTICK_UP = 0xD7; //Gamepad Right Thumbstick up
    var VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN = 0xD8; //Gamepad Right Thumbstick down
    var VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT = 0xD9; //Gamepad Right Thumbstick right
    var VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT = 0xDA; //Gamepad Right Thumbstick left
    var VK_OEM_4 = 0xDB; //It can vary by keyboard. For the US ANSI keyboard, the Left Brace key
    var VK_OEM_5 = 0xDC; //It can vary by keyboard. For the US ANSI keyboard, the Backslash and Pipe key
    var VK_OEM_6 = 0xDD; //It can vary by keyboard. For the US ANSI keyboard, the Right Brace key
    var VK_OEM_7 = 0xDE; //It can vary by keyboard. For the US ANSI keyboard, the Apostrophe and Double Quotation Mark key
    var VK_OEM_8 = 0xDF; //It can vary by keyboard. For the Canadian CSA keyboard, the Right Ctrl key

    var VK_OEM_102 = 0xE2; //It can vary by keyboard. For the European ISO keyboard, the Backslash and Pipe key

    var VK_PROCESSKEY = 0xE5; //IME PROCESS key

    var VK_PACKET = 0xE7; //Used to pass Unicode characters as if they were keystrokes. The VK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP

    var VK_ATTN = 0xF6; //Attn key
    var VK_CRSEL = 0xF7; //CrSel key
    var VK_EXSEL = 0xF8; //ExSel key
    var VK_EREOF = 0xF9; //Erase EOF key
    var VK_PLAY = 0xFA; //Play key
    var VK_ZOOM = 0xFB; //Zoom key
    var VK_NONAME = 0xFC; //Reserved
    var VK_PA1 = 0xFD; //PA1 key
    var VK_OEM_CLEAR = 0xFE; //Clear key
}