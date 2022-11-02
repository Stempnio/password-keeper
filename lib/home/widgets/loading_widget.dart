import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:password_keeper/theme/cubit/theme_cubit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Column(
      children: [
        const Text(
          'Loading data, please wait',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        LoadingAnimationWidget.staggeredDotsWave(
          color: themeCubit.isDark ? Colors.greenAccent : Colors.blue,
          size: 70,
        ),
      ],
    );
  }
}
