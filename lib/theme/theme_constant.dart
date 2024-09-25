import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTheme = ThemeData(
  textTheme: GoogleFonts.workSansTextTheme(),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
      .copyWith(surface: Colors.black, secondary: Colors.orange),
);
