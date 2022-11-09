import 'package:flutter/material.dart';

class LetterSeparator extends StatelessWidget {
  const LetterSeparator({required this.letter, Key? key}) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            letter,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
