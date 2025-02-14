import 'package:flutter/material.dart';
import 'package:flutter_flip_card_animation/data_source/sample_data.dart';
import 'package:flutter_flip_card_animation/widgets/background_widget.dart';
import 'package:flutter_flip_card_animation/widgets/card_widget.dart';
import 'package:flutter_flip_card_animation/widgets/flip_card_widget.dart';

// The main screen of the application, which displays a list of flip cards.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// The state class for HomeScreen, managing the selected card index.
class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Tracks the index of the currently selected card.

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context)
        .size; // Get the screen size for responsive design.
    return Scaffold(
      body: Stack(
        children: [
          // Background widget that changes based on the selected card.
          BackgroundWidget(selectedIndex: selectedIndex),
          // SingleChildScrollView to allow scrolling if the content exceeds the screen height.
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenSize.height *
                    0.4, // Padding to position the cards below the background.
              ),
              child: SizedBox(
                height: 480, // Fixed height for the card container.
                width: screenSize.width, // Full width of the screen.
                child: Center(
                  child: ListView.builder(
                    itemCount: cardImages.length,
                    // Number of cards based on the sample data.
                    scrollDirection: Axis.horizontal,
                    // Horizontal scrolling for the cards.
                    shrinkWrap: true,
                    itemBuilder: (final context, final index) {
                      return FlipCardWidget(
                        onTap: () {
                          setState(() {
                            selectedIndex =
                                index; // Update the selected index when a card is tapped.
                          });
                        },
                        // Front widget of the flip card.
                        frontWidget: CardWidget(
                          image: cardImages[index],
                          title: titles[index],
                          subTitle: subTitles[index],
                          description: descriptions[index],
                          cardType: CardType.front,
                        ),
                        // Back widget of the flip card.
                        backWidget: CardWidget(
                          image: cardImages[index],
                          title: titles[index],
                          subTitle: subTitles[index],
                          description: descriptions[index],
                          cardType: CardType.back,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
