This mod's sole purpose is to refresh the resource pack after the game is finished loading, avoiding the inevitable crash from the error "Only one OpenAL context may be instantiated at any one time." by restarting the whole system.

What little functionality is implemented is located at src/main/java/com/icychkn/openalfix/OpenALFix.java. Everything else in this project originates from an old template that really should be updated, but still builds the mod properly.

The postInit method has a single call to Minecraft.getMinecraft().refreshResources().

Unfortunately it's like using a nuke for pest control.

I'm hoping there is a better method somewhere to restart only the sound system, just haven't found it yet.
