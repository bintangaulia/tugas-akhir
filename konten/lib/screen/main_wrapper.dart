// lib/screen/main_wrapper.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // Menuju file screen.dart Anda

class MainWrapper extends StatefulWidget {
  final String role;
  final String nama;
  final String nis;

  const MainWrapper({
    super.key, 
    required this.role, 
    required this.nama, 
    required this.nis
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List halaman tetap terjaga fungsinya
    final List<Widget> screens = [
      const Center(child: Text("Halaman Beranda\n(Nanti tempel API Teman)", textAlign: TextAlign.center)), 
      const Center(child: Text("Halaman Logbook\n(Nanti tempel API Teman)", textAlign: TextAlign.center)), 
      
      // PERBAIKAN: Nama Class di file screen.dart Anda adalah 'DashboardScreen'
      // Kami panggil sesuai namanya agar fungsi pencarian & list Anda muncul kembali
      DashboardScreen(
        
      ), 
      
      const Center(child: Text("Halaman Profil\n(Nanti tempel API Teman)", textAlign: TextAlign.center)), 
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Logbook'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Edukasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}