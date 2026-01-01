import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screen.dart'; // primaryColor
import 'video_player_screen.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  List<dynamic> allVideos = [];
  bool isLoading = true;

  // ================= FETCH VIDEO =================
  Future<void> fetchVideos() async {
    final url = Uri.parse('http://192.168.56.1:8000/api/contents');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        setState(() {
          allVideos = decoded is List ? decoded : decoded['data'];
          isLoading = false;
        });
      } else {
        throw Exception('Gagal memuat video');
      }
    } catch (e) {
      debugPrint('Error fetching videos: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildVideoList(),
    );
  }

  // ================= APP BAR =================
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daftar Semua Video',
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

  // ================= LIST =================
  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: allVideos.length,
      itemBuilder: (context, index) {
        final item = allVideos[index];
        return _buildVideoItem(context, item);
      },
    );
  }

  // ================= ITEM =================
  Widget _buildVideoItem(BuildContext context, dynamic item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              videoItem: {
                'title': item['title']?.toString() ?? '',
                'source': item['source']?.toString() ?? '',
                'time': item['time']?.toString() ??
                    item['date']?.toString() ??
                    '',
              },
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.play_circle_outline,
              color: primaryColor,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item['source'] ?? ''} • ${item['time'] ?? item['date'] ?? ''}',
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
  }
}
