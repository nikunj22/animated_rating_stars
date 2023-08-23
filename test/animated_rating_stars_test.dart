import 'package:flutter_test/flutter_test.dart';
import 'package:animated_rating_stars/animated_rating_stars_platform_interface.dart';
import 'package:animated_rating_stars/animated_rating_stars_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnimatedRatingStarsPlatform
    with MockPlatformInterfaceMixin
    implements AnimatedRatingStarsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnimatedRatingStarsPlatform initialPlatform =
      AnimatedRatingStarsPlatform.instance;

  test('$MethodChannelAnimatedRatingStars is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnimatedRatingStars>());
  });

  test('getPlatformVersion', () async {
    MockAnimatedRatingStarsPlatform fakePlatform =
        MockAnimatedRatingStarsPlatform();
    AnimatedRatingStarsPlatform.instance = fakePlatform;
  });
}
