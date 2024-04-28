package com.icychkn.openalfix;

import net.minecraft.client.Minecraft;

import cpw.mods.fml.common.Mod;
import cpw.mods.fml.common.event.FMLPostInitializationEvent;
import cpw.mods.fml.common.registry.GameRegistry;

@Mod(modid = OpenALFix.MODID, version = OpenALFix.VERSION, name = OpenALFix.NAME)
public class OpenALFix {
  public static final String MODID = "openalfix";
  public static final String NAME = "openalfix";
  public static final String VERSION = "2024-04-28_R1";

  @Mod.Instance("openalfix")
  public static OpenALFix instance;

  @Mod.EventHandler
  public void postInit(FMLPostInitializationEvent event) {
    Minecraft.getMinecraft().refreshResources();
  }
}
