import 'package:flutter/material.dart';

class TopCaption extends StatelessWidget {
  const TopCaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Passwords are safe with us',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Give them to us',
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 3,
          ),
        ),
        Divider(
          thickness: 2,
          height: 20,
        ),
      ],
    );
  }
}
