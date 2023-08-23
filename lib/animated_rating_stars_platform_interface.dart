import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'animated_rating_stars_method_channel.dart';

abstract class AnimatedRatingStarsPlatform extends PlatformInterface {
  /// Constructs a AnimatedRatingStarsPlatform.
  AnimatedRatingStarsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnimatedRatingStarsPlatform _instance = MethodChannelAnimatedRatingStars();

  /// The default instance of [AnimatedRatingStarsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnimatedRatingStars].
  static AnimatedRatingStarsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnimatedRatingStarsPlatform] when
  /// they register themselves.
  static set instance(AnimatedRatingStarsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
