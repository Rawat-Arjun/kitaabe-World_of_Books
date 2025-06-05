import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/storage/sp_storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static final ThemeCubit _instance = ThemeCubit._internal();

  factory ThemeCubit() => _instance;

  ThemeCubit._internal() : super(ThemeMode.system) {
    loadSavedTheme();
  }

  bool _isLoading = false;

  Future<void> loadSavedTheme() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final isDark = await SpStorageService.hasDarkMode();
      if (!isClosed) {
        emit(isDark ? ThemeMode.dark : ThemeMode.light);
      }
    } catch (e) {
      print('Error loading theme: $e');
    } finally {
      _isLoading = false;
    }
  }

  Future<void> toggleTheme() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final newThemeMode =
          state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      await SpStorageService.setDarkMode(newThemeMode == ThemeMode.dark);

      if (!isClosed) {
        emit(newThemeMode);
      }
    } catch (e) {
      print('Error toggling theme: $e');
    } finally {
      _isLoading = false;
    }
  }
}
