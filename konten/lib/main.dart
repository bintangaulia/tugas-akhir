import 'package:flutter/material.dart';
// Sesuaikan import sesuai struktur folder/file Anda: lib/screen/screen.dart
import 'screen/screen.dart'; 

// --- DEFINISI NILAI WARNA UTAMA ---
const Color _primaryColorValue = Color(0xFF133E87); // #133E87

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
        // Menggunakan ColorScheme untuk theming modern
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColorValue, 
        ).copyWith(
          primary: _primaryColorValue, 
        ),
        
        // Pengaturan AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: _primaryColorValue), 
        ),
        
        useMaterial3: true, 
      ),
      
      // Panggil widget dari file screen.dart
      home: const DashboardScreen(), 
    );
  }
}