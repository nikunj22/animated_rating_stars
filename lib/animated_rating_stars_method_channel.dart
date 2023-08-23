import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'animated_rating_stars_platform_interface.dart';

/// An implementation of [AnimatedRatingStarsPlatform] that uses method channels.
class MethodChannelAnimatedRatingStars extends AnimatedRatingStarsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('animated_rating_stars');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
