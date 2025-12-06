// lib/main.dart

import 'package:flutter/material.dart';
// Ganti 'konten' dengan nama proyek Anda jika berbeda
import 'package:konten/screen/screen.dart';
import 'package:konten/screen/news_screen.dart';

void main() {
  runApp(const UniversityDashboardApp());
}

// Definisikan Nilai Warna Utama agar bisa diakses di semua widget
const Color primaryColorValue = Color(0xFF133E87); // Biru Tua
const Color accentColorValue = Color(0xFF608BC1); // Biru Muda

class UniversityDashboardApp extends StatelessWidget {
  const UniversityDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Akademik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set background utama agar konsisten dengan desain
        scaffoldBackgroundColor: Colors.grey[50],
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColorValue,
          primary: primaryColorValue,
          secondary: accentColorValue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColorValue),
        ),
        useMaterial3: true,
      ),

      // Menggunakan rute bernama
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const DashboardScreen(), // Dashboard adalah halaman utama
        '/news': (context) => const NewsScreen(), // Rute Berita
      },
    );
  }
}
