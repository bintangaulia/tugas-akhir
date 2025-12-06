// lib/screen/screen.dart

import 'package:flutter/material.dart';

// --- DEFINISI WARNA KUSTOM (AMAN DARI WARNING) ---
final Color primaryColor = const Color(0xFF133E87); // Biru Tua: #133E87
final Color accentColor = const Color(0xFF608BC1); // Biru Muda: #608BC1

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // ============================== DATA KONTEN (DIPISAH) ===============================
  final List<Map<String, dynamic>> quickCategories = const [
    {'label': 'Berita', 'icon': Icons.newspaper_outlined},
    {'label': 'Artikel', 'icon': Icons.article_outlined},
    {'label': 'Video', 'icon': Icons.ondemand_video_outlined},
  ];

  final List<Map<String, String>> favoriteContent = const [
    {
      'title': 'Sistem Terdistribusi',
      'subtitle': 'Ahsanun Naseh Khudori, S.kom., M.Kom.',
      'status': 'Aktif',
    },
    {
      'title': 'Machine Learning',
      'subtitle': 'Nindynar Rikatsih, S.Kom., M.Kom.',
      'status': 'Aktif',
    },
    {
      'title': 'Etika Profesi',
      'subtitle': 'Risqy Siwi Pradini, S.S.T., M.Kom.',
      'status': 'Aktif',
    },
  ];

  // Data Khusus untuk Video
  final List<Map<String, String>> latestVideos = const [
    {
      'title': 'Wawancara Eksklusif: Tren AI di Dunia Pendidikan',
      'source': 'Media Kampus',
      'time': '1 Jam Lalu',
      'icon': 'video',
    },
    {
      'title': 'Tutorial Singkat: Instalasi Flutter di MacOS',
      'source': 'Lab Komputer',
      'time': '2 Hari Lalu',
      'icon': 'video',
    },
  ];

  // Data Khusus untuk Artikel
  final List<Map<String, String>> latestArticles = const [
    {
      'title': 'Kiat Sukses Menyusun Proposal Penelitian yang Efektif',
      'source': 'Jurnal Akademik',
      'time': '12 Jam Lalu',
      'icon': 'article',
    },
    {
      'title': 'Jadwal dan Syarat Pendaftaran Program Magang Industri',
      'source': 'Bagian Kemahasiswaan',
      'time': '2 Hari Lalu',
      'icon': 'article',
    },
  ];
  // ====================================================================================

  // --- WIDGET 1: APP BAR & SEARCH BAR ---
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.notifications_none, color: primaryColor, size: 28),
                const SizedBox(width: 10),
                Icon(Icons.person_outline, color: primaryColor, size: 28),
              ],
            ),
            const SizedBox(height: 10),
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: primaryColor),
                  hintText: 'Cari mata kuliah, nama dosen, atau tugas...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET 2: TOMBOL AKSI UTAMA (SHOW MORE) ---
  Widget _buildQuickActionsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              // Pengganti withOpacity(0.3) -> 0.3 * 255 = 76
              color: accentColor.withAlpha(76),
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

  // --- WIDGET 3: NAVIGASI KATEGORI ---
  Widget _buildCategoryNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: quickCategories.map((category) {
          final bool isNews = category['label'] == 'Berita';
          return Flexible(
            child: GestureDetector(
              onTap: () {
                if (isNews) {
                  Navigator.pushNamed(context, '/news');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Anda mengklik ${category['label']}'),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // Pengganti withOpacity(0.2) -> 0.2 * 255 = 51
                          color: Colors.grey.withAlpha(51),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 5),
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
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- WIDGET 4: DAFTAR KARTU HORIZONTAL (MATA KULIAH) ---
  Widget _buildHorizontalCardList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Mata Kuliah Unggulan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favoriteContent.length,
            padding: const EdgeInsets.only(left: 16.0),
            itemBuilder: (context, index) {
              final content = favoriteContent[index];
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // Pengganti withOpacity(0.2) -> 0.2 * 255 = 51
                      color: Colors.grey.withAlpha(51),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Area Biru (Header)
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        // Pengganti withOpacity(0.5) -> 0.5 * 255 = 127
                        color: accentColor.withAlpha(127),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.school,
                          size: 40,
                          // Pengganti withOpacity(0.8) -> 0.8 * 255 = 204
                          color: Colors.white.withAlpha(204),
                        ),
                      ),
                    ),

                    // Area Putih (Detail)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content['title']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: primaryColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            content['subtitle']!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          _buildStatusTag(content['status']!),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget Pembantu untuk Tag Status
  Widget _buildStatusTag(String status) {
    Color tagColor;
    Color textColor;
    switch (status) {
      case 'Aktif':
        tagColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'Tersedia':
        tagColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
      case 'Penuh':
        tagColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        tagColor = Colors.grey.shade100;
        textColor = Colors.grey.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  // --- WIDGET 5: DAFTAR KONTEN VERTIKAL ---
  Widget _buildVerticalContentList(
    String title,
    List<Map<String, String>> data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 15),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            IconData icon = item['icon'] == 'video'
                ? Icons.play_circle_outline
                : Icons.description_outlined;

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      // Pengganti withOpacity(0.1) -> 0.1 * 255 = 25
                      color: Colors.grey.withAlpha(25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ikon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // Pengganti withOpacity(0.1) -> 0.1 * 255 = 25
                        color: accentColor.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: primaryColor, size: 28),
                    ),
                    const SizedBox(width: 12),

                    // Konten Teks
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${item['source']} • ${item['time']}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // --- BUILD UTAMA ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildQuickActionsButton(context),
            const SizedBox(height: 30),
            _buildCategoryNavigation(context),
            const SizedBox(height: 30),
            _buildHorizontalCardList(context),
            const SizedBox(height: 40),

            // === PANGGILAN TERPISAH UNTUK VIDEO DAN ARTIKEL ===
            _buildVerticalContentList('Video Terkini', latestVideos),
            const SizedBox(height: 40),
            _buildVerticalContentList('Artikel Terkini', latestArticles),

            // =================================================
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
