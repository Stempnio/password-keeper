import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({required this.text, required this.icon, Key? key})
      : super(key: key);

  onTap(Function function) {
    function();
  }

  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
