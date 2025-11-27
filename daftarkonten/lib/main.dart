import 'package:flutter/material.dart';
// Sesuaikan import sesuai struktur folder/file Anda: lib/screen/screen.dart
import 'screen/screen.dart'; 

// --- DEFINISI WARNA KUSTOM ---
const Color primaryColor = Color(0xFF133E87); // #133E87

void main() {
  runApp(const UniversityDashboardApp());
}

class UniversityDashboardApp extends StatelessWidget {
  const UniversityDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Akademik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
      ),
      // Panggil widget dari file screen.dart
      home: const DashboardScreen(), 
    );
  }
}