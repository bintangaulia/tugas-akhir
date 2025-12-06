// lib/screen/news_screen.dart

import 'package:flutter/material.dart';
// Import primaryColor dari screen.dart untuk konsistensi warna
import 'screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  // --- DATA DUMMY UNTUK BERITA ---
  final List<Map<String, String>> newsItems = const [
    {
      'title': 'Rektor Tekankan Inovasi Digital dalam Dies Natalis ke-50',
      'source': 'Pengumuman Resmi',
      'date': '26 Nov 2025',
      'image': 'assets/rektor.jpg', // Ganti dengan path gambar jika Anda punya
    },
    {
      'title': 'Pendaftaran Program Pertukaran Pelajar Asia Dibuka',
      'source': 'Kemahasiswaan',
      'date': '24 Nov 2025',
      'image': 'assets/student_exchange.jpg',
    },
    {
      'title': 'Seminar Nasional AI dan Dampaknya pada Industri Kreatif',
      'source': 'Fakultas Teknik',
      'date': '20 Nov 2025',
      'image': 'assets/seminar.jpg',
    },
    {
      'title': 'Perpustakaan Umum Kampus Mengadakan Perpanjangan Jam Buka',
      'source': 'Perpustakaan',
      'date': '15 Nov 2025',
      'image': 'assets/library.jpg',
    },
  ];

  // --- WIDGET UNTUK SATU ITEM BERITA (CARD) ---
  Widget _buildNewsCard(BuildContext context, Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // Shadow yang halus, sesuai dengan tema dashboard
              color: Colors.grey.withAlpha(51), // opacity 0.2
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          // Membuat kartu bisa diklik
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Membaca: ${item['title']}')),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Placeholder (Diganti jika ada path gambar asli)
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    // Ikon placeholder agar tidak kosong
                    child: Icon(Icons.image_outlined, color: Colors.grey[500]),
                  ),
                ),
                const SizedBox(width: 12),

                // Detail Berita
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item['date']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item['source']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- BUILD UTAMA NEWS SCREEN ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Tetapkan background konsisten
      appBar: AppBar(
        title: const Text(
          'Berita Akademik',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          // Gunakan warna primaryColor agar konsisten
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(context, newsItems[index]);
        },
      ),
    );
  }
}
