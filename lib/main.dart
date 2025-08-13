import 'package:flutter/material.dart';
import 'package:stunting_web/pages/home_page.dart';
import 'package:stunting_web/pages/laporan_page.dart';
import 'package:stunting_web/pages/login_page.dart';
import 'package:stunting_web/pages/survey_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cegah Stunting',
      // home: LoginPage(),
      routes: {
        '/': (context) => HomePage(),
        '/survey': (context) => SurveyPage(), // Halaman Survey
        '/laporan': (context) => LaporanPage(), // Halaman Laporan
        // tambahkan route lainnya di sini sesuai kebutuhan
      },
    );
  }
}
