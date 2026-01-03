package;

@:cppFileCode('
#ifdef NEKO_WINDOWS
    #include <windows.h>
    #include <winuser.h>
#endif
')
class Keyboard
{
    // https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-keybd_event
    @:functionCode('
        keybd_event(vKeyCode, scan, flags, 0);
    ')
    public static function hx_keybd_event(vKeyCode:Int, scan:Int = 0, flags:Int =0)
    {}
}
