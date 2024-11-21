import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_manager/generated/assets.gen.dart';
import 'package:flutter_task_manager/utils/app_size.dart';

class Palette {
  static const primaryColor = Color(0xFF006EE5);
  static const secondaryColor = Color(0xFFFFC38D);
  static const accentColor = Color(0xFFFF999D);

  static const divideColor = Color(0xFFECECEC);
  static const statusColorSuccess = Color(0xFF64C94A);
  static const statusColorError = Color(0xFFFA5F5F);
  static const statusColorDisable = Color(0xFFD6D4D4);
  static const textColorSecondary = Color(0xFF7F7F7F);
  static const textColorPrimary = Color(0xFF281616);
  static const backgroundColorBasic = Colors.white;
  static const violetGradient = LinearGradient(
    colors: [
      Color(0xFF8B78FF),
      Color(0xFF5451D6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class ThemeUtils {
  ThemeUtils._privateConstructor();

  static final ThemeUtils getInstance = ThemeUtils._privateConstructor();

  ///Public variable
  ThemeData get lightTheme => _lightTheme;

  ThemeData get _lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: Assets.fonts.productsRegular,
      scaffoldBackgroundColor: _lightColorScheme.background,
      colorScheme: _lightColorScheme,
      textTheme: _textTheme,
      dividerTheme: const DividerThemeData(
        color: Palette.divideColor,
        thickness: 1.1,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      // textTheme: _textLightTheme,
    );
  }

  TextTheme get textTheme {
    return _textTheme;
  }

  /// Comment
  /// parent Theme data set font family
  /// 1. Caption - Use labelLarge instead
  /// 2. Body 2 - Use bodySmall instead
  /// 3. Body 1 - Use body bodyMedium
  /// 4. Body/ Bold - Use bodyLarge with font weight w700
  /// 5. Heading/Sub - Heading - Use headLineSmall
  /// 6. Heading/Heading 3 - Use headlineMedium
  /// 7. Heading/Heading 2 - Use headlineLarge
  TextTheme get _textTheme {
    return TextTheme(
        labelLarge: TextStyle(
          fontFamily: Assets.fonts.productsRegular,
          fontWeight: FontWeight.w500,
          fontSize: AppSize.size16,
          color: Palette.textColorPrimary,
        ),
        labelMedium: TextStyle(
          fontFamily: Assets.fonts.productsRegular,
          fontWeight: FontWeight.w400,
          fontSize: AppSize.size14,
          color: Palette.textColorPrimary,
        ),
        labelSmall: TextStyle(
          fontFamily: Assets.fonts.productsRegular,
          fontWeight: FontWeight.w300,
          fontSize: AppSize.size12,
          color: Palette.textColorPrimary,
        ),
        bodySmall: TextStyle(
          fontFamily: Assets.fonts.productsRegular,
          fontWeight: FontWeight.w400,
          fontSize: AppSize.size14,
          color: Palette.textColorPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: Assets.fonts.productsRegular,
          fontWeight: FontWeight.w400,
          fontSize: AppSize.size16,
          color: Palette.textColorPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: Assets.fonts.productsBold,
          fontWeight: FontWeight.w700,
          fontSize: AppSize.size16,
          color: Palette.textColorPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: Assets.fonts.productsBold,
          fontWeight: FontWeight.w700,
          color: Palette.textColorPrimary,
          fontSize: AppSize.size16,
        ),
        headlineMedium: TextStyle(
          fontFamily: Assets.fonts.productsBold,
          fontWeight: FontWeight.w700,
          fontSize: AppSize.size24,
          color: Palette.textColorPrimary,
        ),
        headlineLarge: TextStyle(
          fontFamily: Assets.fonts.productsBold,
          fontWeight: FontWeight.w700,
          fontSize: AppSize.size36,
          color: Palette.textColorPrimary,
        ));
  }

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
      seedColor: Palette.primaryColor,
      brightness: Brightness.light,
      primary: Palette.primaryColor,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.white,
      secondary: Palette.secondaryColor,
      onSecondaryContainer: Colors.white,
      onError: Palette.statusColorError,
      errorContainer: Colors.white,
      onSurface: Palette.backgroundColorBasic);
}
