abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsThemeChanged extends SettingsState {
  final bool isDarkMode;
  SettingsThemeChanged(this.isDarkMode);
}

class SettingsNotificationsChanged extends SettingsState {
  final bool isEnabled;
  SettingsNotificationsChanged(this.isEnabled);
}