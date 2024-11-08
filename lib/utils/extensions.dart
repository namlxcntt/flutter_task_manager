import 'package:flutter/material.dart';
import 'package:flutter_task_manager/generated/l10n.dart';
import 'package:gap/gap.dart';

extension ContextExt on BuildContext {
  S getLocaleDelegate() {
    return S.of(this);
  }

  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme getColorScheme() {
    return Theme.of(this).colorScheme;
  }

  /// For Text style
  TextStyle? bodyMedium() => getTextTheme().bodyMedium;

  TextStyle? bodySmall() => getTextTheme().bodySmall;

  TextStyle? bodyLarge() => getTextTheme().bodyLarge;

  TextStyle? labelSmall() => getTextTheme().labelSmall;

  TextStyle? labelMedium() => getTextTheme().labelMedium;

  TextStyle? labelLarge() => getTextTheme().labelLarge;

  TextStyle? titleLarge() => getTextTheme().titleLarge;

  TextStyle? titleMedium() => getTextTheme().titleMedium;

  TextStyle? titleSmall() => getTextTheme().titleSmall;

  TextStyle? headlineSmall() => getTextTheme().headlineSmall;

  TextStyle? headlineMedium() => getTextTheme().headlineMedium;

  TextStyle? headlineLarge() => getTextTheme().headlineLarge;
}

extension ColorExt on Color {
  ColorFilter colorFilter() {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}

extension PaddingExt on double {
  EdgeInsets paddingHorizontal() {
    return EdgeInsets.symmetric(horizontal: this);
  }

  EdgeInsets paddingVertical() {
    return EdgeInsets.symmetric(horizontal: this);
  }

  EdgeInsets paddingAll() {
    return EdgeInsets.all(this);
  }

  Gap gap() {
    return Gap(this);
  }
}
