import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa_app/screens/spa_screen.dart';

void main() => runApp(const ProviderScope(child: SpaApp()));

class SpaApp extends StatelessWidget {
  const SpaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'SpaApp',
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
    ),
    home: const SpaScreen(),
  );
}
