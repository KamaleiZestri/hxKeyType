package;

import hxkeytype.KeyProcessor;

class Test
{
    public static function main ():Void 
    {
        KeyProcessor.typeString("Hello World!\n");
        KeyProcessor.typeString("0123456789\n");
        KeyProcessor.typeString("-=\\[];',./`\n");
        KeyProcessor.typeString("~!@#$%^&*()_+|<>?:\"{}\n");
        Sys.println("Done");   
    }
}
