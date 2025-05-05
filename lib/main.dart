import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_hartono_app/shared/shared.dart';
import 'package:my_hartono_app/ui/pages/pages.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SharedString.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.light().textTheme
        ).copyWith(
          titleLarge: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            color: textPrimary
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 14,
            color: textPrimary
          ),
          bodySmall: GoogleFonts.inter(
              fontSize: 12,
              color: textPrimary
          ),
          bodyMedium: GoogleFonts.inter(
              fontSize: 14,
              color: textPrimary
          ),
        )
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
