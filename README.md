# flutter_flip_card_animation

This project is a Flutter-based application that demonstrates a flip card animation using custom widgets and animations. The app allows users to interact with a series of cards, each of which can be flipped to reveal additional information on the back. The project is designed to showcase how to create visually appealing and interactive UI components in Flutter, such as flip animations, responsive layouts, and dynamic content rendering.

# Key Features of the Project

    Flip Card Animation:

        The core feature of the project is the flip card animation, implemented using the FlipCardWidget. This widget allows users to tap on a card to flip it, revealing the back side with additional details.

        The animation is smooth and uses 3D transformations (via Matrix4 and Transform) to create a realistic flipping effect.

    Dynamic Background:

        The background of the app changes dynamically based on the selected card. This is achieved using the BackgroundWidget, which updates its appearance depending on the selectedIndex state.

    Horizontal Scrolling Cards:

        The cards are displayed in a horizontally scrollable list using ListView.builder. This allows users to browse through multiple cards seamlessly.

    Reusable Widgets:

        The project is built using reusable widgets like CardWidget and FlipCardWidget, making the code modular and easy to maintain.

        The CardWidget is responsible for displaying the content of the card (image, title, subtitle, and description) in either the front or back state.

    Responsive Design:

        The app is designed to be responsive, adapting to different screen sizes using MediaQuery and flexible layouts.

    Sample Data Integration:

        The app uses sample data (e.g., cardImages, titles, subTitles, and descriptions) to populate the cards. This data is stored in a separate file (sample_data.dart) for easy management.


# Project Structure

The project is organized into several key files:

    flip_card_widget.dart:

        Contains the FlipCardWidget, which handles the flip animation logic using AnimationController and Transform.

    card_widget.dart:

        Defines the CardWidget, which displays the content of the card (image, title, subtitle, and description) in either the front or back state.

    home_screen.dart:

        The main screen of the app, which integrates the FlipCardWidget, CardWidget, and BackgroundWidget to create the interactive card-flipping experience.

    background_widget.dart:

        A widget that dynamically changes the background based on the selected card.

    sample_data.dart:

        Contains sample data (e.g., images, titles, subtitles, and descriptions) used to populate the cards.


# How It Works

    User Interaction:

        When the user taps on a card, the FlipCardWidget triggers the flip animation, toggling between the front and back views of the card.

        The selectedIndex is updated to reflect the currently selected card, which in turn updates the background.

    Animation:

        The flip animation is powered by an AnimationController and Matrix4 transformations. The card rotates along the Y-axis to create a 3D flip effect.

    Dynamic Content:

        The CardWidget displays different content based on whether the card is in the front or back state. The front shows the image, title, and subtitle, while the back shows the same image with a semi-transparent overlay and additional description text.

    Background Update:

        The BackgroundWidget listens to changes in the selectedIndex and updates its appearance accordingly, creating a cohesive visual experience.
        

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ales-dev-studio/flutter-flip-card-animation.git
   ```

2. Change to the project directory:

   ```bash
   cd flutter-flip-card-animation
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```
