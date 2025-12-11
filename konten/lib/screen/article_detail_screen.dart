// lib/screen/article_detail_screen.dart

import 'package:flutter/material.dart';
import 'screen.dart'; // Import warna (primaryColor)

class ArticleDetailScreen extends StatelessWidget {
  // Terima data artikel yang diklik
  final Map<String, String> articleItem;

  const ArticleDetailScreen({super.key, required this.articleItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          articleItem['source'] ??
              'Detail Artikel', // Tampilkan sumber di AppBar
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Artikel
              Text(
                articleItem['title']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              // Meta Data (Sumber dan Waktu)
              Text(
                'Sumber: ${articleItem['source']} • Dipublikasikan: ${articleItem['time']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Divider(height: 30),

              // Isi Artikel Dummy
              const Text(
                'Artikel ini membahas tentang kiat-kiat sukses dalam menyusun proposal penelitian yang sistematis dan mudah diterima oleh pihak penilai. Fokus utama meliputi metodologi yang kuat, tinjauan literatur yang komprehensif, dan kerangka waktu yang realistis.\n\nMembuat proposal yang efektif memerlukan perencanaan yang matang. Dimulai dengan merumuskan masalah penelitian yang jelas dan relevan, diikuti dengan penetapan tujuan yang terukur. Jangan lupa menyertakan kontribusi potensial dari penelitian Anda terhadap bidang ilmu terkait.\n\nPastikan struktur proposal Anda mengikuti standar akademis yang berlaku, mencakup Pendahuluan, Tinjauan Pustaka, Metodologi Penelitian, Jadwal Pelaksanaan, dan Daftar Pustaka. Konsultasi dengan dosen pembimbing sangat dianjurkan untuk menghindari kesalahan fatal dalam penyusunan.',
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
