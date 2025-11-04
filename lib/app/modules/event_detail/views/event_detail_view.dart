import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: Get.theme.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/concert.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Tanggal & Lokasi
                  _buildInfoRow(Icons.calendar_today_outlined, '20 Des 2025'),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                      Icons.location_on_outlined, 'Stadion Utama, Jakarta'),
                  const SizedBox(height: 24),

                  // Deskripsi
                  Text(
                    'Deskripsi Event',
                    style: Get.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Konser yang Seru',
                    style:
                        Get.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 100), // Spacer agar tidak tertutup tombol
                ],
              ),
            ),
          ),
        ],
      ),
      // Tombol Beli Tiket di bagian bawah
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          // Navigasi GetX: Pindah ke halaman Pilih Tiket
          onPressed: () => Get.toNamed(Routes.TICKET_SELECTION),
          child: const Text(
            'Beli Tiket',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Get.theme.primaryColor, size: 20),
        const SizedBox(width: 12),
        Text(text, style: Get.textTheme.titleMedium),
      ],
    );
  }
}