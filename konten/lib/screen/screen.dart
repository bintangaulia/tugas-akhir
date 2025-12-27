// lib/screen/screen.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'video_player_screen.dart';
import 'article_detail_screen.dart';

// --- DEFINISI WARNA KUSTOM ---
final Color primaryColor = const Color(0xFF133E87);
final Color accentColor = const Color(0xFF608BC1);

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userRole = 'mahasiswa'; 
  String userName = 'Rizky';
  
  // Controller untuk menangkap input pencarian
  final TextEditingController _searchController = TextEditingController();
  // Notifier untuk memantau perubahan teks pencarian
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");

  // List untuk menampung notifikasi dari API Kelompok 4
  List<Map<String, String>> newNotifications = [];

  // ============================== DATA KONTEN ===============================
  final List<Map<String, dynamic>> quickCategories = const [
    {'label': 'Berita', 'icon': Icons.newspaper_outlined},
    {'label': 'Artikel', 'icon': Icons.article_outlined},
    {'label': 'Video', 'icon': Icons.ondemand_video_outlined},
  ];

  final List<Map<String, String>> favoriteContent = const [
    {'title': 'Sistem Terdistribusi', 'subtitle': 'Ahsanun Naseh Khudori, S.kom., M.Kom.', 'status': 'Aktif'},
    {'title': 'Machine Learning', 'subtitle': 'Nindynar Rikatsih, S.Kom., M.Kom.', 'status': 'Aktif'},
    {'title': 'Etika Profesi', 'subtitle': 'Risqy Siwi Pradini, S.S.T., M.Kom.', 'status': 'Aktif'},
  ];

  final List<Map<String, String>> latestVideos = const [
    {'title': 'Wawancara Eksklusif: Tren AI di Pendidikan', 'source': 'Media Kampus', 'time': '1 Jam Lalu', 'icon': 'video'},
    {'title': 'Tutorial Singkat: Instalasi Flutter', 'source': 'Lab Komputer', 'time': '2 Hari Lalu', 'icon': 'video'},
  ];

  final List<Map<String, String>> latestArticles = const [
    {'title': 'Kiat Sukses Proposal Penelitian', 'source': 'Jurnal Akademik', 'time': '12 Jam Lalu', 'content': 'Isi artikel proposal...', 'icon': 'article'},
    {'title': 'Jadwal dan Syarat Pendaftaran Program Magang Industri', 'source': 'Bagian Kemahasiswaan', 'time': '2 Hari Lalu', 'content': 'Isi artikel magang...', 'icon': 'article'},
  ];

  @override
  void initState() {
    super.initState();
    checkForUpdates(); // Ambil update dari API Kelompok 4 saat aplikasi dibuka
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchQuery.dispose();
    super.dispose();
  }

  // --- FUNGSI CEK UPDATE DARI API KELOMPOK 4 ---
  Future<void> checkForUpdates() async {
    final url = Uri.parse("https://micro.deva-syaiful.my.id/api/documentation"); 
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        DateTime now = DateTime.now();
        
        setState(() {
          newNotifications = data.where((item) {
            // Logika: Anggap baru jika dibuat dalam 24 jam terakhir
            DateTime postDate = DateTime.parse(item['created_at']); 
            return now.difference(postDate).inHours < 24;
          }).map<Map<String, String>>((item) => {
            'title': item['title'].toString(),
            'time': item['created_at'].toString(),
            'icon': 'article',
            'content': item['content'] ?? 'Isi berita tidak tersedia',
            'source': 'Admin Kelompok 4'
          }).toList();
        });
      }
    } catch (e) {
      debugPrint("Gagal cek update: $e");
    }
  }

  // --- LOGIKA NAVIGASI DETAIL ---
  void _navigateToDetail(Map<String, String> item) {
    if (item['icon'] == 'video') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoItem: item)));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailScreen(articleItem: item)));
    }
  }

  // --- LOGIKA MODAL NOTIFIKASI ---
  void _showNotificationList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Update Informasi Terkini", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
              const Divider(),
              if (newNotifications.isEmpty)
                const Padding(padding: EdgeInsets.all(20), child: Text("Belum ada update hari ini."))
              else
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: newNotifications.length,
                    itemBuilder: (context, index) {
                      final item = newNotifications[index];
                      return ListTile(
                        leading: const Icon(Icons.fiber_new, color: Colors.red),
                        title: Text(item['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        subtitle: Text("Baru • ${item['time']}"),
                        onTap: () {
                          Navigator.pop(context); 
                          _navigateToDetail(item); 
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // --- LOGIKA FILTER DATA ---
  List<T> _filterData<T>(List<T> data, String query, String Function(T) getTitle) {
    if (query.isEmpty) return data;
    return data.where((item) => getTitle(item).toLowerCase().contains(query.toLowerCase())).toList();
  }

  // --- LOGIKA PERSONALISASI TEKS ---
  String _getGreeting() {
    switch (userRole) {
      case 'admin_prodi': return 'Halo, Admin Prodi';
      case 'admin_poli': return 'Halo, Admin Poli';
      case 'dosen': return 'Halo, Bapak/Ibu Dosen';
      case 'mahasiswa': return 'Halo, Rekan Mahasiswa';
      default: return 'Selamat Datang';
    }
  }

  String _getSearchHint() {
    if (userRole.contains('admin')) return 'Cari data akademik...';
    if (userRole == 'dosen') return 'Cari mahasiswa atau materi...';
    return 'Cari mata kuliah, video, atau artikel...';
  }

  // --- WIDGET 1: APP BAR ---
  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 130,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getGreeting(), style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  Text(userName, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications_none, color: primaryColor, size: 28),
                        onPressed: () => _showNotificationList(context), 
                      ),
                      if (newNotifications.isNotEmpty)
                        Positioned(
                          right: 12,
                          top: 12,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                            constraints: const BoxConstraints(minWidth: 8, minHeight: 8),
                            child: Text(
                              '${newNotifications.length}',
                              style: const TextStyle(color: Colors.white, fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(backgroundColor: accentColor.withAlpha(50), child: Icon(Icons.person, color: primaryColor)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15.0)),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _searchQuery.value = value, 
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: primaryColor),
                hintText: _getSearchHint(),
                hintStyle: const TextStyle(fontSize: 14),
                border: InputBorder.none,
                suffixIcon: ValueListenableBuilder(
                  valueListenable: _searchQuery,
                  builder: (context, query, child) {
                    return query.isEmpty 
                      ? const SizedBox.shrink() 
                      : IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            _searchQuery.value = "";
                          },
                        );
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET 2: HORIZONTAL LIST ---
  Widget _buildHorizontalCardList(String query) {
    final filteredContent = _filterData(favoriteContent, query, (item) => item['title']!);
    if (filteredContent.isEmpty) return const SizedBox.shrink();
    String sectionTitle = userRole == 'dosen' ? 'Mata Kuliah Diampu' : 'Mata Kuliah Unggulan';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(sectionTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredContent.length,
            padding: const EdgeInsets.only(left: 16.0),
            itemBuilder: (context, index) {
              final content = filteredContent[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.grey.withAlpha(51), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(color: accentColor.withAlpha(127), borderRadius: const BorderRadius.vertical(top: Radius.circular(15))),
                      child: const Center(child: Icon(Icons.school, size: 35, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(content['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          Text(content['subtitle']!, style: const TextStyle(fontSize: 11, color: Colors.grey), maxLines: 1),
                        ],
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

  // --- WIDGET 3: VERTIKAL LIST (KLIK AKTIF) ---
  Widget _buildVerticalContentList(String title, List<Map<String, String>> data, String query) {
    final filteredData = _filterData(data, query, (item) => item['title']!);
    if (filteredData.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            final item = filteredData[index];
            bool isVideo = item['icon'] == 'video';
            return ListTile(
              onTap: () => _navigateToDetail(item), // Sekarang bisa dipencet
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: accentColor.withAlpha(30), borderRadius: BorderRadius.circular(8)),
                child: Icon(isVideo ? Icons.play_circle : Icons.article, color: primaryColor),
              ),
              title: Text(item['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text('${item['source']} • ${item['time']}', style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ValueListenableBuilder(
        valueListenable: _searchQuery,
        builder: (context, query, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                if (query.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: quickCategories.map((cat) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (cat['label'] == 'Berita') Navigator.pushNamed(context, '/news');
                              if (cat['label'] == 'Artikel') Navigator.pushNamed(context, '/articles');
                              if (cat['label'] == 'Video') Navigator.pushNamed(context, '/videos');
                            },
                            child: CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(cat['icon'], color: primaryColor)),
                          ),
                          const SizedBox(height: 5),
                          Text(cat['label'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      )).toList(),
                    ),
                  ),
                if (query.isEmpty) const SizedBox(height: 30),
                _buildHorizontalCardList(query),
                const SizedBox(height: 30),
                _buildVerticalContentList('Video Terkini', latestVideos, query),
                _buildVerticalContentList('Artikel Terkini', latestArticles, query),
                if (query.isNotEmpty && 
                    _filterData(favoriteContent, query, (i) => i['title']!).isEmpty &&
                    _filterData(latestVideos, query, (i) => i['title']!).isEmpty &&
                    _filterData(latestArticles, query, (i) => i['title']!).isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
                        const SizedBox(height: 10),
                        Text("Data '$query' tidak ditemukan", style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}