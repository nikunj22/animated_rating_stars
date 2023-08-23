#ifndef FLUTTER_PLUGIN_ANIMATED_RATING_STARS_PLUGIN_H_
#define FLUTTER_PLUGIN_ANIMATED_RATING_STARS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace animated_rating_stars {

class AnimatedRatingStarsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AnimatedRatingStarsPlugin();

  virtual ~AnimatedRatingStarsPlugin();

  // Disallow copy and assign.
  AnimatedRatingStarsPlugin(const AnimatedRatingStarsPlugin&) = delete;
  AnimatedRatingStarsPlugin& operator=(const AnimatedRatingStarsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace animated_rating_stars

#endif  // FLUTTER_PLUGIN_ANIMATED_RATING_STARS_PLUGIN_H_
