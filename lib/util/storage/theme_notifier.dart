import 'package:flutter/material.dart';

import 'sp_storage_service.dart';

final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

void toggleTheme(bool isDark) async {
  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
  await SpStorageService.setDarkMode(isDark);
}
