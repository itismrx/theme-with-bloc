import 'package:hive/hive.dart';
part 'theme_hive.g.dart';

@HiveType(typeId: 0)
class ThemeDatabase {
  @HiveField(0)
  bool? themeSetting;

  ThemeDatabase({required this.themeSetting});
}
