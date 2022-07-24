import 'package:flutter/material.dart';
import 'package:flutterxy/dashboards/main_dashboard.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterxy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: UtilFunctions.generateMaterialColor(
          StyleValues.primaryColor,
        ),
        scaffoldBackgroundColor: StyleValues.backgroundColor,
      ),
      home: const MainDashboard(),
    );
  }
}
