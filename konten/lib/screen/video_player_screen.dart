// lib/screen/video_player_screen.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // Import warna (primaryColor)

class VideoPlayerScreen extends StatelessWidget {
  // Terima data video yang diklik
  final Map<String, String> videoItem;

  const VideoPlayerScreen({super.key, required this.videoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemutar Video',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Placeholder Video Player Area ---
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                      size: 60,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'VIDEO IS PLAYING HERE',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            // --- Detail Video ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoItem['title']!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sumber: ${videoItem['source']} • Diunggah: ${videoItem['time']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Deskripsi:\nVideo ini memberikan panduan mendalam tentang topik yang dibahas. Fokus pada aspek teknis dan implementasi langkah demi langkah. Cocok untuk mahasiswa tingkat lanjut yang sedang mengerjakan proyek akhir.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
