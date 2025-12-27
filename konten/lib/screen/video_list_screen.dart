import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screen.dart'; // Import warna (primaryColor)
import 'video_player_screen.dart'; // Import navigasi

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  List<dynamic> allVideos = [];
  bool isLoading = true;

  // --- FUNGSI AMBIL DATA DARI API ---
  Future<void> fetchVideos() async {
    // Ganti URL ini dengan endpoint API Video milikmu
    final url = Uri.parse("https://domainkamu.com/api/videos"); 

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        setState(() {
          // Sesuaikan 'data' jika API kamu membungkus list dalam key tertentu
          allVideos = decodedData is List ? decodedData : decodedData['data'];
          isLoading = false;
        });
      } else {
        throw Exception("Gagal memuat video");
      }
    } catch (e) {
      setState(() => isLoading = false);
      print("Error fetching videos: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideos(); // Jalankan saat layar dibuka
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Semua Video',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor), // Gunakan primaryColor
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Tampilkan loading
          : ListView.builder(
              itemCount: allVideos.length,
              itemBuilder: (context, index) {
                final item = allVideos[index];
                return InkWell(
                  onTap: () {
                    // Navigasi ke pemutar video
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          videoItem: {
                            'title': item['title']?.toString() ?? '',
                            'source': item['source']?.toString() ?? '',
                            'time': item['time']?.toString() ?? item['date']?.toString() ?? '',
                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.play_circle_outline, color: primaryColor, size: 30),
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
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}