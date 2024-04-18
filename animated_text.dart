import 'package:flutter/material.dart';

class AnimaText extends StatefulWidget {
  const AnimaText({Key? key}) : super(key: key);

  @override
  _AnimaTextState createState() => _AnimaTextState();
}

class _AnimaTextState extends State<AnimaText> {
  final List<String> texts = [
    'Never miss an update',
    'Never forget anything',
    'Never lose track',
  ];

  int currentIndex = 0;
  bool isTyping = true;
  String displayText = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateText();
    });
  }

  void _animateText() async {
    if (isTyping) {
      if (displayText.length < texts[currentIndex].length) {
        await Future.delayed(const Duration(milliseconds: 55));
        setState(() {
          displayText = texts[currentIndex].substring(0, displayText.length + 1);
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 750));
        setState(() {
          isTyping = false;
        });
      }
    } else {
      if (displayText.isNotEmpty) {
        await Future.delayed(const Duration(milliseconds: 35));
        setState(() {
          displayText = displayText.substring(0, displayText.length - 1);
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 50));
        setState(() {
          isTyping = true;
          currentIndex = (currentIndex + 1) % texts.length;
        });
      }
    }
    _animateText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: SizedBox(
        width: 250,
        child: Text(
          displayText,
          style: const TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
