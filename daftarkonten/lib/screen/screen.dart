import 'package:flutter/material.dart';

// --- 1. DEFINISI WARNA KUSTOM (DIHAPUS 'const' UNTUK MENGHILANGKAN WARNING DEPRECATED) ---
final Color primaryColor = const Color(0xFF133E87); // Biru Tua: #133E87
final Color accentColor = const Color(0xFF608BC1); // Biru Muda: #608BC1

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Data Kategori Cepat
  final List<Map<String, dynamic>> quickCategories = const [
    {'label': 'Berita', 'icon': Icons.newspaper_outlined},
    {'label': 'Artikel', 'icon': Icons.article_outlined},
    {'label': 'Video', 'icon': Icons.ondemand_video_outlined},
    {'label': 'Diskusi', 'icon': Icons.chat_bubble_outline},
  ];

  // --- Tampilan 1 (SEARCH BAR) ---
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          // Icon Pencarian
          icon: Icon(Icons.search, color: primaryColor),
          hintText: 'Cari mata kuliah, nama dosen, atau tugas...',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          // Tombol Aksi di ujung kanan (Ikon Send)
          suffixIcon: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
    );
  }

  // --- Tampilan 2 (SHOW MORE) ---
  Widget _buildQuickActionsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: accentColor, // Warna #608BC1
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              // Gunakan withOpacity untuk bayangan
              color: accentColor.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.menu_open, color: Colors.white),
          label: const Text(
            'SHOW MORE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  // --- Tmapilan 3 NAVIGASI KATEGORI (BERITA, ARTIKEL, VIDEO, DISKUSI) ---
  Widget _buildCategoryNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: quickCategories.map((category) {
          return Flexible(
            child: Column(
              children: [
                // Container untuk ikon dan bayangan
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: primaryColor, // Warna #133E87
                    size: 28,
                  ),
                ),
                const SizedBox(height: 5),
                // Label Teks
                Text(
                  category['label'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- FUNGSI APP BAR (MENGGABUNGKAN SEARCH BAR DAN IKON AKSI) ---
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(
          children: [
            // Ikon Aksi (Notifikasi & Profil)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.notifications_none, color: primaryColor, size: 28),
                const SizedBox(width: 10),
                Icon(Icons.person_outline, color: primaryColor, size: 28),
              ],
            ),
            const SizedBox(height: 10),
            // Panggil Search Bar
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  //                          STRUKTUR UTAMA LAYAR
  // =========================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bilah Aplikasi di atas
      appBar: _buildAppBar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Panggil Tombol SHOW MORE (Tahap 2)
            _buildQuickActionsButton(context),

            const SizedBox(height: 30),

            // Panggil Navigasi Kategori (Tahap 3)
            _buildCategoryNavigation(context),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'Area ini akan berisi Konten Dashboard Utama (Tahap 4)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ... di dalam class DashboardScreen ...

  // Data Konten Horizontal (Menggantikan Paket Wisata)
  final List<Map<String, String>> favoriteContent = const [
    {
      'title': 'Struktur Data & Algoritma',
      'subtitle': 'Dr. Ir. Budi Santoso, M.Kom',
      'status': 'Aktif',
      'image': 'assets/dosen1.jpg', // Placeholder image
    },
    {
      'title': 'Kalkulus Lanjut',
      'subtitle': 'Prof. Dr. Rina Kusuma',
      'status': 'Tersedia',
      'image': 'assets/dosen2.jpg', // Placeholder image
    },
    {
      'title': 'Basis Data Terdistribusi',
      'subtitle': 'Ir. Surya Pratama, S.T.',
      'status': 'Penuh',
      'image': 'assets/dosen3.jpg', // Placeholder image
    },
  ];

// ...