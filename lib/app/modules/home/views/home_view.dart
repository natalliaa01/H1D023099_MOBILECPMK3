import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EchoVoice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.confirmation_num_outlined),
            onPressed: () => Get.toNamed(Routes.MY_TICKETS),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Padding utama kita pindah ke sini
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16), // Beri jarak dari AppBar
            
            // 1. Banner Event Populer
            _buildBanner(),
            
            // 2. List Kategori
            _buildSectionTitle('Lagi Cari Apa?'),
            _buildCategories(), 
            
            // 3. List Event
            _buildSectionTitle('Yang Paling Ditunggu'),
            _buildEventList(),
            
            const SizedBox(height: 16), // Beri jarak di bawah
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.EVENT_DETAIL),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/konser.png', 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: Get.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return const SizedBox(
      height: 110, // Ukuran ini sudah pas (dari perbaikan overflow)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CategoryItem(
            icon: Icons.music_note,
            label: 'Musik',
          ),
          _CategoryItem(
            icon: Icons.sports_soccer,
            label: 'Olahraga',
          ),
          _CategoryItem(
            icon: Icons.school,
            label: 'Seminar',
          ),
          _CategoryItem(
            icon: Icons.theater_comedy,
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    return Column(
      children: [
        _EventCard(
          title: 'Coldplay Live In Jakarta',
          date: '20 July 2026',
          location: 'Gelora Bung Karno, Jakarta',
          imagePath: 'assets/images/konser.png',
          onTap: () => Get.toNamed(Routes.EVENT_DETAIL),
        ),
        _EventCard(
          title: 'Blackpink World Tour',
          date: '22 October 2026',
          location: 'Gelora Bung Karno, Jakarta',
          imagePath: 'assets/images/konser.png',
          onTap: () => Get.toNamed(Routes.EVENT_DETAIL),
        ),
      ],
    );
  }
}

// --- Widget Lokal untuk Halaman Home ---

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            child: Icon(icon, size: 30, color: Colors.deepPurple),
          ),
          const SizedBox(height: 8),
          Text(label, style: Get.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

// --- PERUBAHAN BESAR DI SINI ---
// Kita ubah _EventCard agar lebih modern
class _EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String imagePath; // Tambah ini
  final VoidCallback onTap;

  const _EventCard({
    required this.title,
    required this.date,
    required this.location,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Kita ganti Card dengan Container + InkWell agar lebih fleksibel
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang card putih
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Ini adalah bayangan (shadow) yang rapi
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath, // Gunakan path dari parameter
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Get.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    // Ubah warna teks agar tidak terlalu pekat
                    Text(date,
                        style: Get.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text(location,
                        style: Get.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[600])),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}