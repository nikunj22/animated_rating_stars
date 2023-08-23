import 'package:flutter/material.dart';

/// A customizable animated rating bar widget.
///
/// Users can interact with this widget to provide a rating.
class AnimatedRatingStars extends StatefulWidget {
  /// The initial rating for the widget.
  final double initialRating;

  /// The minimum rating value.
  final double minRating;

  /// The maximum rating value.
  final double maxRating;

  /// The color for filled stars.
  final Color filledColor;

  /// The color for empty stars.
  final Color emptyColor;

  /// The icon used for filled stars.
  final IconData filledIcon;

  /// The icon used for half-filled stars.
  final IconData halfFilledIcon;

  /// The icon used for empty stars.
  final IconData emptyIcon;

  /// A callback function called when the rating changes.
  final Function(double) onChanged;

  // New properties

  /// Determines whether to display the rating value.
  final bool displayRatingValue;

  /// Determines whether to enable interactive tooltips.
  final bool interactiveTooltips;

  /// The custom icon for filled stars.
  final IconData customFilledIcon;

  /// The custom icon for half-filled stars.
  final IconData customHalfFilledIcon;

  /// The custom icon for empty stars.
  final IconData customEmptyIcon;

  /// The size of each star.
  final double starSize;

  /// The duration of the animation when the rating changes.
  final Duration animationDuration;

  /// The curve for the animation when the rating changes.
  final Curve animationCurve;

  /// Determines whether the widget is read-only.
  final bool readOnly;

  /// Creates an [AnimatedRatingStars] widget.
  const AnimatedRatingStars({
    super.key,
    this.initialRating = 0.0,
    this.minRating = 0.0,
    this.maxRating = 5.0,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    this.filledIcon = Icons.star,
    this.halfFilledIcon = Icons.star_half,
    this.emptyIcon = Icons.star_border,
    required this.onChanged,
    this.displayRatingValue = true,
    this.interactiveTooltips = false,
    required this.customFilledIcon,
    required this.customHalfFilledIcon,
    required this.customEmptyIcon,
    this.starSize = 30.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.readOnly = false,
  });

  @override
  _AnimatedRatingStarsState createState() => _AnimatedRatingStarsState();
}

class _AnimatedRatingStarsState extends State<AnimatedRatingStars> {
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating.toInt(), (index) {
        return GestureDetector(
          onTap: () {
            if (!widget.readOnly) {
              double selectedRating = index.toDouble() + 1.0;
              if (_rating == selectedRating && widget.interactiveTooltips) {
                _rating -= 0.5; // Toggle half-star state
              } else {
                _rating = selectedRating;
              }
              widget.onChanged(_rating);
              setState(() {}); // Rebuild widget to reflect changes
            }
          },
          child: AnimatedStar(
            filled: _rating >= index + 1,
            halfFilled: widget.interactiveTooltips && _rating == index + 0.5,
            filledColor: widget.filledColor,
            emptyColor: widget.emptyColor,
            filledIcon: widget.customFilledIcon,
            halfFilledIcon: widget.customHalfFilledIcon,
            emptyIcon: widget.customEmptyIcon,
            starSize: widget.starSize,
            animationDuration: widget.animationDuration,
            animationCurve: widget.animationCurve,
          ),
        );
      }),
    );
  }
}

/// A single animated star widget.
class AnimatedStar extends StatefulWidget {
  /// Determines whether the star is filled.
  final bool filled;

  /// Determines whether the star is half-filled.
  final bool halfFilled;

  /// The color for filled stars.
  final Color filledColor;

  /// The color for empty stars.
  final Color emptyColor;

  /// The icon used for filled stars.
  final IconData filledIcon;

  /// The icon used for half-filled stars.
  final IconData halfFilledIcon;

  /// The icon used for empty stars.
  final IconData emptyIcon;

  /// The size of the star.
  final double starSize;

  /// The duration of the animation when the star state changes.
  final Duration animationDuration;

  /// The curve for the animation when the star state changes.
  final Curve animationCurve;

  /// Creates an [AnimatedStar] widget.
  const AnimatedStar({
    super.key,
    this.filled = false,
    this.halfFilled = false,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    this.filledIcon = Icons.star,
    this.halfFilledIcon = Icons.star_half,
    this.emptyIcon = Icons.star_border,
    this.starSize = 30.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  _AnimatedStarState createState() => _AnimatedStarState();
}

class _AnimatedStarState extends State<AnimatedStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ),
    );

    if (widget.filled || widget.halfFilled) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedStar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.filled != oldWidget.filled ||
        widget.halfFilled != oldWidget.halfFilled) {
      if (widget.filled || widget.halfFilled) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Icon(
          widget.filled
              ? widget.filledIcon
              : widget.halfFilled
                  ? widget.halfFilledIcon
                  : widget.emptyIcon,
          color: Color.lerp(
            widget.emptyColor,
            widget.filledColor,
            _animation.value,
          ),
          size: widget.starSize + 8.0 * _animation.value,
        );
      },
    );
  }
}
