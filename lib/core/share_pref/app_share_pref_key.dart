/// Define Key
enum AppSharePrefKey {
  tokenUser,
  localeManager,
  stateWidget
}

extension AppSharePrefKeyEx on AppSharePrefKey {
  String getKey() {
    return name;
  }
}