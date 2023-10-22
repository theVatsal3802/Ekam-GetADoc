import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0165FB),
      onPrimary: Colors.white,
      secondary: Color(0xffDBEAFF),
      onSecondary: Color(0xff242424),
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Color(0xff242424),
      surface: Colors.white,
      onSurface: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Color(0xff242424),
      elevation: GeneralSize.zero,
      iconTheme: IconThemeData(
        color: Color(0xff242424),
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xff242424),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xff242424),
      ),
      headlineMedium: TextStyle(
        color: Color(0xff838383),
      ),
      headlineSmall: TextStyle(
        color: Colors.grey,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff0165fb),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
      ),
    ),
    chipTheme: ChipThemeData(
      selectedColor: const Color(0xff0165fb),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusSize.borderRadius),
      ),
      showCheckmark: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.buttonPaddingLarge,
          vertical: PaddingSize.buttonPaddingSmall,
        ),
        alignment: Alignment.center,
        backgroundColor: const Color(0xff0165fb),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusSize.borderRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: const Color(0xff0165fb),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusSize.borderRadius),
        ),
      ),
    ),
  );
}
