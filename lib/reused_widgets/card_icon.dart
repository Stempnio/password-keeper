import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  const CardIcon(
      {required this.text, required this.icon, required this.onTap, Key? key})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Card(
          elevation: 5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Icon(
                  icon,
                  size: 60,
                ),
                const Spacer(),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
