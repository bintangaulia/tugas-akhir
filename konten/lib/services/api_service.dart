import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import '../models/video_model.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.56.1:8000/api';

  // ================= ARTIKEL / BERITA =================
  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/contents'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List data = decoded is List ? decoded : decoded['data'];
      return data.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil artikel');
    }
  }

  // ================= VIDEO =================
  Future<List<Video>> fetchVideos() async {
    final response = await http.get(Uri.parse('$baseUrl/contents'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List data = decoded is List ? decoded : decoded['data'];
      return data.map((e) => Video.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil video');
    }
  }
}
