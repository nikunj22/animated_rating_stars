#include "include/animated_rating_stars/animated_rating_stars_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "animated_rating_stars_plugin.h"

void AnimatedRatingStarsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  animated_rating_stars::AnimatedRatingStarsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
