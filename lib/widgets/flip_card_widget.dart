import 'dart:math'; // Importing the math library for mathematical constants like pi.

import 'package:flutter/material.dart'; // Importing the Flutter material design library.

// A StatefulWidget that creates a flip card animation.
class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({
    super.key,
    required this.frontWidget, // The widget to display on the front of the card.
    required this.backWidget, // The widget to display on the back of the card.
    this.animationDuration = const Duration(
      milliseconds: 500,
    ), // Duration of the flip animation.
    this.onTap, // Optional callback when the card is tapped.
  });

  final Widget frontWidget;
  final Widget backWidget;
  final Duration animationDuration;
  final GestureTapCallback? onTap;

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

// The state class for FlipCardWidget, managing the animation and flip logic.
class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController; // Controls the animation.
  bool isFront = true; // Tracks whether the front of the card is visible.
  double anglePlus = 0; // Additional angle for the flip animation.

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with the specified duration.
    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  // Function to flip the card.
  Future flipCard() async {
    widget.onTap?.call(); // Invoke the optional onTap callback.

    if (animationController.isAnimating) {
      return; // Prevent flipping during an ongoing animation.
    }

    isFront = !isFront; // Toggle the front/back state.
    await animationController.forward(from: 0).then((onValue) {
      return anglePlus =
          pi; // Set the additional angle to pi (180 degrees) after the animation.
    });
  }

  // Determines whether the front widget should be displayed based on the current angle.
  bool isFrontWidget(double angle) {
    const degree90 = pi / 2;
    const degree270 = 3 * pi / 2;
    return angle <= degree90 || angle >= degree270;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (final context, final child) {
        double angle = animationController.value *
            pi; // Calculate the current angle of the flip.
        late Matrix4 transform;
        late Matrix4 transformForBack;

        if (isFront) {
          angle += anglePlus; // Adjust the angle if the front is visible.
        }

        // Create a transformation matrix for the front card.
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);

        // Create a transformation matrix for the back card.
        transformForBack = Matrix4.identity()..rotateY(pi);

        return InkWell(
          onTap: flipCard, // Trigger the flip animation on tap.
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child:
                // Display the front widget if the angle is within the range.
                isFrontWidget(angle.abs())
                    ? widget.frontWidget
                    : Transform(
                        transform: transformForBack,
                        alignment: Alignment.center,
                        // Display the back widget otherwise.
                        child: widget.backWidget,
                      ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the animation controller to free resources.
    animationController.dispose();
  }
}
