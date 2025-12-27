import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article_detail_screen.dart';
import 'screen.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  List articles = [];
  bool isLoading = true;

  // lib/screen/article_list_screen.dart

  Future<void> fetchArticles() async {
    final url = Uri.parse(
      'https://domainkamu.com/api/articles',
    ); // Pastikan URL ini benar
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final decoded = jsonDecode(res.body);

        setState(() {
          // Jika API kamu formatnya { "data": [...] } gunakan decoded['data']
          // Jika API kamu langsung [...] gunakan decoded
          articles = decoded is List ? decoded : decoded['data'];
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error Fetch Artikel: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel'),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, i) {
                final item = articles[i];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['source']),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ArticleDetailScreen(
                          articleItem: {
                            'title': item['title'],
                            'source': item['source'],
                            'time': item['time'],
                            'content': item['content'],
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
