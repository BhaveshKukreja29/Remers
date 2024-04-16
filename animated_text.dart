import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimaText extends StatelessWidget {
  const AnimaText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: SizedBox(
        width: 250,
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Never miss an update',
                textStyle: const TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                speed: const Duration(milliseconds: 60)),
            TyperAnimatedText('Never forget anything',
                textStyle: const TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                speed: const Duration(milliseconds: 60)),
            TyperAnimatedText('Never lose track',
                textStyle: const TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                speed: const Duration(milliseconds: 60)),

          ],
          repeatForever: true,
          totalRepeatCount: 3, // Set the number of times the animation should repeat
        ),
      ),
    );
  }
}