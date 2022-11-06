import 'package:flutter/material.dart';

class LetterSeparator extends StatelessWidget {
  const LetterSeparator({required this.letter, Key? key}) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          letter,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
