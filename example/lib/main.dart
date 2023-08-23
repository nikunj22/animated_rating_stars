import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  /// Constructs a new instance of [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _rating = 2.5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Animated Rating Stars',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Animated Rating Stars"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Rating: $_rating',
                  style: const TextStyle(fontSize: 24.0),
                ),
                AnimatedRatingStars(
                  initialRating: 2.5,
                  onChanged: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                  displayRatingValue: true, // Display the rating value
                  interactiveTooltips: true, // Allow toggling half-star state
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 40.0,
                  animationDuration: const Duration(milliseconds: 500),
                  animationCurve: Curves.easeInOut,
                ),
              ],
            ),
          ),
        ));
  }
}
