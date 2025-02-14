import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_flip_card_animation/data_source/sample_data.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: screenWidth.width,
          height: screenWidth.height,
          child: Image.asset(
            bgImages[selectedIndex],
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SizedBox(
            width: screenWidth.width,
            height: screenWidth.height,
          ),
        ),
      ],
    );
  }
}
