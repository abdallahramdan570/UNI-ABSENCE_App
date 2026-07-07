import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/Settings/presentation/cubit/app_flobal_state.dart';

class AppGlobalCubit extends Cubit<SettingsState> {
  AppGlobalCubit() : super(SettingsInitial());

  bool isDarkMode = false;
  bool notificationsEnabled = true;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    emit(SettingsThemeChanged(isDarkMode));
  }

  void toggleNotifications() {
    notificationsEnabled = !notificationsEnabled;
    emit(SettingsNotificationsChanged(notificationsEnabled));
  }
}