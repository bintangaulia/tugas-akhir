// lib/screen/article_list_screen.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // Import warna
import 'article_detail_screen.dart'; // Import halaman detail untuk navigasi

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  // Data Daftar Artikel Lengkap (Digabung dari data dummy di screen.dart)
  final List<Map<String, String>> allArticles = const [
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
    {
      'title': 'Pentingnya Etika Data dalam Penelitian Ilmiah Modern',
      'source': 'Pusat Riset',
      'time': '5 Hari Lalu',
      'icon': 'article',
    },
    {
      'title': 'Tips Mengelola Stres Akademik Selama Masa Ujian Akhir',
      'source': 'Biro Konseling',
      'time': '1 Minggu Lalu',
      'icon': 'article',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Semua Artikel',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: allArticles.length,
        itemBuilder: (context, index) {
          final item = allArticles[index];
          return InkWell(
            // Tambahkan InkWell untuk klik
            onTap: () {
              // Navigasi ke halaman detail saat item diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(articleItem: item),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: primaryColor,
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
