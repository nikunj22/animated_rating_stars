import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_rating_stars/animated_rating_stars_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAnimatedRatingStars platform = MethodChannelAnimatedRatingStars();
  const MethodChannel channel = MethodChannel('animated_rating_stars');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
