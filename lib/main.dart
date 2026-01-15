import 'package:flutter/material.dart';
// Import file-file yang sudah kita buat tadi
import 'screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Berita Kampus',
      debugShowCheckedModeBanner: false,
      
      // Mengatur Tema Global Aplikasi
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF133E87),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF133E87),
          primary: const Color(0xFF133E87),
          secondary: const Color(0xFF608BC1),
        ),
        // Mengatur font default agar terlihat lebih modern
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF133E87),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      
      // Halaman pertama yang muncul saat APK dibuka
      home: const HomeScreen(),
    );
  }
}