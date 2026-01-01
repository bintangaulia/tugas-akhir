// lib/screen/news_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article_detail_screen.dart';
import 'screen.dart'; // primaryColor

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> newsItems = [];
  bool isLoading = true;

  // ================= FETCH DATA =================
  Future<void> fetchNews() async {
    final url = Uri.parse('http://192.168.56.1:8000/api/contents');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        setState(() {
          newsItems = decoded is List ? decoded : decoded['data'];
          isLoading = false;
        });
      } else {
        throw Exception('Gagal mengambil data berita');
      }
    } catch (e) {
      debugPrint('Error News: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(context),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                return _buildNewsCard(context, newsItems[index]);
              },
            ),
    );
  }

  // ================= APP BAR =================
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Berita Akademik',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: primaryColor),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }

  // ================= CARD =================
  Widget _buildNewsCard(BuildContext context, dynamic item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ArticleDetailScreen(
                articleItem: {
                  'title': item['title'] ?? '',
                  'source': item['author'] ?? 'Admin',
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
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              _buildThumbnail(item),
              const SizedBox(width: 12),
              _buildContent(item),
            ],
          ),
        ),
      ),
    );
  }

  // ================= THUMBNAIL =================
  Widget _buildThumbnail(dynamic item) {
    return Container(
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
    );
  }

  // ================= TEXT CONTENT =================
  Widget _buildContent(dynamic item) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                item['news_category'] ?? 'Berita',
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '• ${item['author'] ?? 'Admin'}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
