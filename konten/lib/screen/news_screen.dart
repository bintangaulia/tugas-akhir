// lib/screen/news_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article_detail_screen.dart'; // Untuk navigasi ke detail
import 'screen.dart'; // Import warna (primaryColor)

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> newsItems = [];
  bool isLoading = true;

  // --- FETCH DATA BERITA ---
  Future<void> fetchNews() async {
    // Sesuaikan URL ini dengan endpoint berita dari kelompok 1
    final url = Uri.parse("https://micro.deva-syaiful.my.id/api/news"); 

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        setState(() {
          // Biasanya data berita dibungkus dalam key 'data'
          newsItems = decoded is List ? decoded : decoded['data'];
          isLoading = false;
        });
      } else {
        throw Exception("Gagal mengambil data berita");
      }
    } catch (e) {
      setState(() => isLoading = false);
      print("Error News: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Berita Akademik',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                final item = newsItems[index];
                return _buildNewsCard(context, item);
              },
            ),
    );
  }

  Widget _buildNewsCard(BuildContext context, dynamic item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Kirim data ke detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(
                articleItem: {
                  'title': item['title'] ?? '',
                  'source': item['author'] ?? 'Admin', // Mengambil data Author dari admin
                  'time': item['created_at'] ?? '',
                  'content': item['content'] ?? '',
                },
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            children: [
              // THUMBNAIL (Berdasarkan field di admin)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  image: item['thumbnail'] != null
                      ? DecorationImage(
                          image: NetworkImage(item['thumbnail']),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Text(
                      item['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // AUTHOR & CATEGORY
                    Row(
                      children: [
                        Text(
                          item['news_category'] ?? 'Berita', // Mengambil News Category
                          style: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "• ${item['author'] ?? 'Admin'}",
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
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
    );
  }
}