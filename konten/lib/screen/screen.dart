// lib/screen/screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'video_player_screen.dart';
import 'article_detail_screen.dart';

// ================== WARNA GLOBAL ==================
final Color primaryColor = const Color(0xFF133E87);
final Color accentColor  = const Color(0xFF608BC1);

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // ================== USER ==================
  String userRole = 'mahasiswa';
  String userName = 'Rizky';

  // ================== SEARCH ==================
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier('');

  // ================== NOTIFIKASI ==================
  List<Map<String, String>> newNotifications = [];

  // ================== DATA DUMMY ==================
  final List<Map<String, dynamic>> quickCategories = const [
    {'label': 'Berita',  'icon': Icons.newspaper_outlined},
    {'label': 'Artikel', 'icon': Icons.article_outlined},
    {'label': 'Video',   'icon': Icons.ondemand_video_outlined},
  ];

  final List<Map<String, String>> favoriteContent = const [
    {
      'title': 'Sistem Terdistribusi',
      'subtitle': 'Ahsanun Naseh Khudori, S.Kom., M.Kom.',
      'status': 'Aktif'
    },
    {
      'title': 'Machine Learning',
      'subtitle': 'Nindynar Rikatsih, S.Kom., M.Kom.',
      'status': 'Aktif'
    },
    {
      'title': 'Etika Profesi',
      'subtitle': 'Risqy Siwi Pradini, S.S.T., M.Kom.',
      'status': 'Aktif'
    },
  ];

  final List<Map<String, String>> latestVideos = const [
    {
      'title': 'Wawancara Eksklusif: Tren AI di Pendidikan',
      'source': 'Media Kampus',
      'time': '1 Jam Lalu',
      'icon': 'video'
    },
    {
      'title': 'Tutorial Singkat: Instalasi Flutter',
      'source': 'Lab Komputer',
      'time': '2 Hari Lalu',
      'icon': 'video'
    },
  ];

  final List<Map<String, String>> latestArticles = const [
    {
      'title': 'Kiat Sukses Proposal Penelitian',
      'source': 'Jurnal Akademik',
      'time': '12 Jam Lalu',
      'content': 'Isi artikel proposal...',
      'icon': 'article'
    },
    {
      'title': 'Jadwal dan Syarat Pendaftaran Program Magang Industri',
      'source': 'Bagian Kemahasiswaan',
      'time': '2 Hari Lalu',
      'content': 'Isi artikel magang...',
      'icon': 'article'
    },
  ];

  // ================== LIFECYCLE ==================
  @override
  void initState() {
    super.initState();
    checkForUpdates();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchQuery.dispose();
    super.dispose();
  }

  // ================== API NOTIFIKASI ==================
  Future<void> checkForUpdates() async {
    final url = Uri.parse('http://192.168.56.1:8000/api/contents');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) return;

      final List<dynamic> data = jsonDecode(response.body);
      final now = DateTime.now();

      setState(() {
        newNotifications = data.where((item) {
          final postDate = DateTime.parse(item['created_at']);
          return now.difference(postDate).inHours < 24;
        }).map<Map<String, String>>((item) => {
              'title': item['title'].toString(),
              'time': item['created_at'].toString(),
              'icon': 'article',
              'content': item['content'] ?? 'Konten tidak tersedia',
              'source': 'Admin Kelompok 4',
            }).toList();
      });
    } catch (e) {
      debugPrint('Gagal cek update: $e');
    }
  }

  // ================== NAVIGASI ==================
  void _navigateToDetail(Map<String, String> item) {
    if (item['icon'] == 'video') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(videoItem: item),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ArticleDetailScreen(articleItem: item),
        ),
      );
    }
  }

  // ================== HELPER ==================
  List<T> _filterData<T>(
    List<T> data,
    String query,
    String Function(T) getTitle,
  ) {
    if (query.isEmpty) return data;
    return data
        .where((item) =>
            getTitle(item).toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  String _getGreeting() {
    switch (userRole) {
      case 'admin_prodi':
        return 'Halo, Admin Prodi';
      case 'admin_poli':
        return 'Halo, Admin Poli';
      case 'dosen':
        return 'Halo, Bapak/Ibu Dosen';
      default:
        return 'Halo, Rekan Mahasiswa';
    }
  }

  String _getSearchHint() {
    if (userRole.contains('admin')) return 'Cari data akademik...';
    if (userRole == 'dosen') return 'Cari mahasiswa atau materi...';
    return 'Cari mata kuliah, video, atau artikel...';
  }

  // ================== UI ==================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getGreeting(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _searchController,
            onChanged: (value) => _searchQuery.value = value,
            decoration: InputDecoration(
              hintText: _getSearchHint(),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Menu Cepat',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: quickCategories.map((category) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => debugPrint('Tapped: ${category['label']}'),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(category['icon'] as IconData, size: 28, color: accentColor),
                          const SizedBox(height: 8),
                          Text(
                            category['label'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCardList(String query) {
    final filtered = _filterData(
      favoriteContent,
      query,
      (item) => item['title'] ?? '',
    );

    if (filtered.isEmpty && query.isNotEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            'Mata Kuliah Favorit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final item = filtered[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: accentColor),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['subtitle'] ?? '',
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item['status'] ?? '',
                        style: const TextStyle(fontSize: 10, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalContentList(
    String title,
    List<Map<String, String>> data,
    String query,
  ) {
    final filtered = _filterData(data, query, (item) => item['title'] ?? '');

    if (filtered.isEmpty && query.isNotEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final item = filtered[index];
            return ListTile(
              onTap: () => _navigateToDetail(item),
              title: Text(item['title'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(item['source'] ?? ''),
                  Text(
                    item['time'] ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
      valueListenable: _searchQuery,
      builder: (context, query, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (query.isEmpty) _buildQuickMenu(),
              const SizedBox(height: 30),
              _buildHorizontalCardList(query),
              const SizedBox(height: 30),
              _buildVerticalContentList('Video Terkini', latestVideos, query),
              _buildVerticalContentList('Artikel Terkini', latestArticles, query),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}