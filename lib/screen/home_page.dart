import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/theme_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              state.isLight! ? 'Light Mode' : 'Dark Mode',
              style: TextStyle(
                color: state.isLight! ? Colors.black : Colors.white,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (state.isLight!) {
                BlocProvider.of<ThemeCubit>(context).darkMode();
              } else {
                BlocProvider.of<ThemeCubit>(context).lightMode();
              }
            },
            tooltip: state.isLight! ? 'Light Mode' : 'Dark Mode',
            child: const Icon(Icons.switch_left_rounded),
          ),
        );
      },
    );
  }
}
