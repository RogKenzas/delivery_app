import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color brandPrimary = Color(0xFFFF7A00); // Orange vif
  static const Color brandSecondary = Color(0xFFFFA726); // Orange clair
  static const Color brandDark = Color(0xFFCC5F00); // Orange foncé
  static const Color neutralWhite = Colors.white;
  static const Color neutralBlack = Color(0xFF101010);
}

class AppGradients {
  AppGradients._();

  static const LinearGradient splash = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA726), Color(0xFFFF7A00)],
  );
}

class AppRadii {
  AppRadii._();

  static const BorderRadius small = BorderRadius.all(Radius.circular(8));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12));
  static const BorderRadius large = BorderRadius.all(Radius.circular(20));
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle brandTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.neutralWhite,
    letterSpacing: 0.2,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.neutralBlack,
  );
}

ThemeData buildAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.brandPrimary,
      primary: AppColors.brandPrimary,
      secondary: AppColors.brandSecondary,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: AppTextStyles.body,
      titleLarge: AppTextStyles.brandTitle,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.neutralBlack,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
