import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article_detail_screen.dart';
import 'screen.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> articleItem;

  const ArticleDetailScreen({super.key, required this.articleItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(articleItem['title'] ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articleItem['source'] ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                articleItem['time'] ?? '',
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              Text(
                articleItem['content'] ?? 'Konten tidak tersedia',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
