// lib/screen/video_list_screen.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // Import warna
import 'video_player_screen.dart'; // Import halaman detail untuk navigasi

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  // Data Daftar Video Lengkap (Digabung dari data dummy di screen.dart)
  final List<Map<String, String>> allVideos = const [
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
    {
      'title': 'Webinar: Keamanan Jaringan Era Cloud Computing',
      'source': 'Pusat Keilmuan',
      'time': '1 Minggu Lalu',
      'icon': 'video',
    },
    {
      'title': 'Review Perpustakaan Digital Kampus Terbaru',
      'source': 'Pusat Informasi',
      'time': '3 Hari Lalu',
      'icon': 'video',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Semua Video',
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
        itemCount: allVideos.length,
        itemBuilder: (context, index) {
          final item = allVideos[index];
          return InkWell(
            // Tambahkan InkWell untuk klik
            onTap: () {
              // Navigasi ke halaman pemutar video saat item diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoItem: item),
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
                    Icons.play_circle_outline,
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
