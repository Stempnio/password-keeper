import 'package:flutter/material.dart';

class FetchCredentialsError extends StatelessWidget {
  const FetchCredentialsError({Key? key}) : super(key: key);

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
