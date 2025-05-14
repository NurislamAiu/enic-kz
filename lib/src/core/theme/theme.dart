import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Color(0xFF002D72),      // глубокий синий — основной цвет
    secondary: Color(0xFFFFA726),    // оранжевый — акцент
    background: Color(0xFFF5F7FA),   // светло-серый фон
    surface: Colors.white,           // карточки
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: Color(0xFFF5F7FA),
  textTheme: GoogleFonts.robotoTextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF002D72),
    foregroundColor: Colors.white,
    elevation: 2,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    filled: true,
    fillColor: Colors.white,
  ),
);