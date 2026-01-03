package hxkeytype;

import hxkeytype.KeyboardWinCpp.Keyboard;
import hxkeytype.VirtualKeyCodes.VKey;

class KeyProcessor
{
    public static function pressKey(vkey:VKey)
    {
        Keyboard.hx_keybd_event(vkey.toInt());
    }

    public static function releaseKey(vkey:VKey)
    {
        Keyboard.hx_keybd_event(vkey.toInt(),0,0x002);
    }

    public static function typeVKey(vkey:VKey)
    {
        pressKey(vkey);
        releaseKey(vkey);
    }

    public static function typeVKeyMod(vkey:VKey, modkey:VKey)
    {
        pressKey(modkey);
        pressKey(vkey);
        releaseKey(vkey);
        releaseKey(modkey);
    }

    /**
        Types the given Unicode-value int as a key on the keyboard.
    **/
    public static function typeChar(char:Int)
    {
        var key = VKey.fromUnicode(char);
        var mod = VKey.getModifier(char);
        typeVKeyMod(key,mod);
    }

    public static function typeString(inputstr:String,sleep:Int = 0)
    {
        var inputArr = inputstr.split("");

        for(char in inputArr)
        {
            typeChar(char.charCodeAt(0));
            Sys.sleep(sleep);
        }
    }
}
