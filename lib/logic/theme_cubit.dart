import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:theme_bloc/theme_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(isLight: ThemeDataService.getThemeSettings()),
        );

  void lightMode() => emit(ThemeState(isLight: true));

  void darkMode() => emit(ThemeState(isLight: false));
}
