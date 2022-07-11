import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_bloc/logic/theme_cubit.dart';
import 'package:theme_bloc/services/theme_service.dart';

import 'screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeDataService.createDatabase();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Themeing With Bloc',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: state.isLight! ? Brightness.light : Brightness.dark),
          home: const MyHomePage(),
        );
      },
    );
  }
}
