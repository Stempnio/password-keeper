import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Error while downloading data, please try again',
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
