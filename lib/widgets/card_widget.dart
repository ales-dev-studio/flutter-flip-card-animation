import 'package:flutter/material.dart';

// Enum to differentiate between the front and back of the card.
enum CardType {
  front,
  back,
}

// A StatelessWidget that displays the content of a card, either front or back.
class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image, // The image to display on the card.
    required this.title, // The title text to display on the card.
    required this.subTitle, // The subtitle text to display on the card.
    required this.description, // The description text to display on the back of the card.
    required this.cardType, // Whether the card is in the front or back state.
  });

  final String image;
  final String title;
  final String subTitle;
  final String description;
  final CardType cardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0, // Fixed width for the card.
      height: 480.0, // Fixed height for the card.
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0, // Horizontal margin for spacing between cards.
      ),
      child: Stack(
        children: [
          // ClipRRect to create rounded corners for the card image.
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth, // Fit the image to the width of the card.
            ),
          ),
          // If the card is in the back state, overlay a semi-transparent black layer.
          if (cardType == CardType.back)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.black
                    .withOpacity(0.7), // Semi-transparent black overlay.
              ),
            ),
          // Padding for the text content inside the card.
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: Column(
              // Align the text content based on whether the card is front or back.
              mainAxisAlignment: cardType == CardType.front
                  ? MainAxisAlignment
                      .end // Align text to the bottom for the front card.
                  : MainAxisAlignment.start,
              // Align text to the top for the back card.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the title text.
                Text(
                  title,
                  style: const TextStyle(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 8.0, // Spacing between title and subtitle.
                ),
                // Display the subtitle text.
                Text(subTitle),
                // If the card is in the back state, display the description text.
                if (cardType == CardType.back) ...[
                  const SizedBox(
                    height: 16.0, // Spacing between subtitle and description.
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 2.0, // Line height for better readability.
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
