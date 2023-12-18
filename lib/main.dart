import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla_app/colors.dart';

import 'presentation/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        textTheme: TextTheme(
            bodySmall: GoogleFonts.lato(
              fontSize: 24,
              color: TextColors.textBodySmallColor,
              fontWeight: FontWeight.w400,
            ),
            bodyLarge: GoogleFonts.lato(
              fontSize: 40,
              color: TextColors.textBodyLargeColor,
              fontWeight: FontWeight.w900,
            )),
        baseColor: AppColors.neumorphicBackgroundColor,
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      // ),
      home: WelcomeScreen(),
    );
  }
}
