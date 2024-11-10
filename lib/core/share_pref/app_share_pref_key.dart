/// Define Key
enum AppSharePrefKey {
  tokenUser,
  refreshToken,
  localeManager,
  stateWidget
}

extension AppSharePrefKeyEx on AppSharePrefKey {
  String getKey() {
    return name;
  }
}