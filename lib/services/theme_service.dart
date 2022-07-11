import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:theme_bloc/theme_hive.dart';

class ThemeDataService {
  ThemeDataService._();

  static var themeBox;

  static Future<void> checkDatabaseExist() async {
    Directory themeDatabaseDir = await getApplicationDocumentsDirectory();

    Hive.init(themeDatabaseDir.path);

    if (await Hive.boxExists('themeBox')) {
      themeBox = await Hive.openBox('themeBox');
    } else {
      createDatabase();
    }
  }

  static Future<void> createDatabase() async {
    Directory themeDatabaseDir = await getApplicationSupportDirectory();
    Hive.init(themeDatabaseDir.path);
    Hive.registerAdapter(ThemeDatabaseAdapter());

    themeBox = await Hive.openBox('themeBox');
    await themeBox.put('themeSettings', true);
  }

  static putThemeSetting(bool? themeflag) {
    themeBox.put('themeSettings', themeflag);
  }

  static bool getThemeSettings() {
    bool themeSettingValue = themeBox.get('themeSettings') ?? true;
    return themeSettingValue;
  }
}
