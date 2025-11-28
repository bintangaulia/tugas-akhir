import 'package:flutter/material.dart';

// --- DEFINISI WARNA KUSTOM (MENGHILANGKAN WARNING DEPRECATED) ---
// Menggunakan 'final' untuk memungkinkan penggunaan .withOpacity() yang aman
final Color primaryColor = const Color(0xFF133E87); // Biru Tua: #133E87
final Color accentColor = const Color(0xFF608BC1); // Biru Muda: #608BC1

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // =========================================================================
  //                            DATA KONTEN
  // =========================================================================

  // Data Kategori Cepat (Tahap 3)
  final List<Map<String, dynamic>> quickCategories = const [
    {'label': 'Berita', 'icon': Icons.newspaper_outlined},
    {'label': 'Artikel', 'icon': Icons.article_outlined},
    {'label': 'Video', 'icon': Icons.ondemand_video_outlined},
    {'label': 'Diskusi', 'icon': Icons.chat_bubble_outline},
  ];

  // Data Konten Horizontal (Tahap 4)
  final List<Map<String, String>> favoriteContent = const [
    {
      'title': 'Struktur Data & Algoritma',
      'subtitle': 'Dr. Ir. Budi Santoso, M.Kom',
      'status': 'Aktif',
    },
    {
      'title': 'Kalkulus Lanjut',
      'subtitle': 'Prof. Dr. Rina Kusuma',
      'status': 'Tersedia',
    },
    {
      'title': 'Basis Data Terdistribusi',
      'subtitle': 'Ir. Surya Pratama, S.T.',
      'status': 'Penuh',
    },
  ];

  // Data Konten Vertikal - VIDEO TERKINI (Tahap 5)
  final List<Map<String, String>> latestVideos = const [
    {
      'title': 'Wawancara Eksklusif: Tren AI di Dunia Pendidikan',
      'source': 'Media Kampus',
      'time': '2 Jam Lalu',
      'icon': 'video',
    },
    {
      'title': 'Tutorial Singkat: Instalasi Flutter di MacOS',
      'source': 'Lab Komputer',
      'time': '1 Hari Lalu',
      'icon': 'video',
    },
  ];

  // Data Konten Vertikal - ARTIKEL TERKINI (Tahap 5)
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

  // =========================================================================
  //                       KOMPONEN UTAMA (WIDGETS)
  // =========================================================================

  // --- WIDGET 1: BILAH PENCARIAN (SEARCH BAR) ---
  Widget _buildSearchBar() {
    return Container(
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
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
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

  // --- WIDGET 3: NAVIGASI KATEGORI (BERITA, ARTIKEL, VIDEO, DISKUSI) ---
  Widget _buildCategoryNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: quickCategories.map((category) {
          return Flexible(
            child: Column(
              children: [
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
          );
        }).toList(),
      ),
    );
  }

  // --- WIDGET 4: DAFTAR KARTU HORIZONTAL (DOSEN/MATA KULIAH) ---
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
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favoriteContent.length,
            padding: const EdgeInsets.only(left: 16.0),
            itemBuilder: (context, index) {
              final content = favoriteContent[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      child: Center(
                          child: Icon(Icons.school, size: 50, color: Colors.white.withOpacity(0.8))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content['title']!,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            content['subtitle']!,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: content['status'] == 'Aktif' ? Colors.green[100] : Colors.orange[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              content['status']!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: content['status'] == 'Aktif' ? Colors.green[800] : Colors.orange[800],
                              ),
                            ),
                          ),
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

  // --- WIDGET 5: DAFTAR KONTEN VERTIKAL (VIDEO & ARTIKEL) ---
  Widget _buildVerticalContentList(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Bagian
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

        // Daftar Item Vertikal
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            IconData icon = item['icon'] == 'video' ? Icons.play_circle_outline : Icons.description_outlined;

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
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
                        color: accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: primaryColor, size: 28),
                    ),
                    const SizedBox(width: 12),
                    
                    // Teks Konten
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                item['source']!,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const Text(' • ', style: TextStyle(color: Colors.grey)),
                              Text(
                                item['time']!,
                                style: TextStyle(fontSize: 12, color: primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Ikon aksi
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // --- FUNGSI APP BAR ---
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
      appBar: _buildAppBar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildQuickActionsButton(context), // Tombol SHOW MORE
            const SizedBox(height: 30),
            _buildCategoryNavigation(context), // Ikon Kategori
            const SizedBox(height: 30),
            _buildHorizontalCardList(context), // Konten Horizontal
            
            const SizedBox(height: 40), 

            // Panggil Daftar Video Terkini
            _buildVerticalContentList('Video Terkini', latestVideos), 
            
            const SizedBox(height: 40), 

            // Panggil Daftar Artikel Terkini
            _buildVerticalContentList('Artikel Terkini', latestArticles), 
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}