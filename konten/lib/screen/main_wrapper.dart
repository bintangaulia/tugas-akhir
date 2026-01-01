// lib/screen/main_wrapper.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // DashboardScreen
import 'profil/profile_screen.dart'; // ✅ TAMBAH INI

class MainWrapper extends StatefulWidget {
  final String role;
  final String nama;
  final String nis;

  const MainWrapper({
    super.key,
    required this.role,
    required this.nama,
    required this.nis,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      // 🏠 Beranda
      Center(
        child: Text(
          "Halaman Beranda\nRole: ${widget.role}",
          textAlign: TextAlign.center,
        ),
      ),

      // 📘 Logbook
      const Center(
        child: Text(
          "Halaman Logbook\n(Nanti tempel API Teman)",
          textAlign: TextAlign.center,
        ),
      ),

      // 🎓 Edukasi
      const DashboardScreen(),

      // 👤 Profil (PAKAI UI ASLI)
      ProfileScreen(), // ✅ INI YANG PENTING
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF133E87),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Logbook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
