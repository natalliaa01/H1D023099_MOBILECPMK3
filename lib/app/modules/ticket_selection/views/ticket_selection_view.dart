import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/ticket_selection_controller.dart';

class TicketSelectionView extends GetView<TicketSelectionController> {
  const TicketSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Tiket'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Menampilkan UI Stepper (statis, tidak perlu fungsional)
          _TicketTypeCard(
            type: 'VIP',
            price: 'Rp 500.000',
            description: 'Duduk di barisan depan + Merchandise',
          ),
          _TicketTypeCard(
            type: 'Reguler',
            price: 'Rp 250.000',
            description: 'Area festival berdiri',
          ),
          _TicketTypeCard(
            type: 'Early Bird (Habis)',
            price: 'Rp 150.000',
            description: 'Stok terbatas, sudah habis terjual',
            isSoldOut: true,
          ),
        ],
      ),
      // Bagian bawah untuk ringkasan dan tombol
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: Rp 0', // Statis
              style: Get.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Navigasi GetX: Kembali ke Home, lalu buka My Tickets
              onPressed: () {
                Get.snackbar(
                  'Pembelian Berhasil',
                  'Tiket Anda telah ditambahkan ke "Tiket Saya".',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                // Kembali ke root (Home) dan hapus semua halaman sebelumnya
                Get.offAllNamed(Routes.HOME);
                // Buka halaman My Tickets
                Get.toNamed(Routes.MY_TICKETS);
              },
              child: const Text(
                'Bayar Sekarang (Dummy)',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Widget Lokal untuk Halaman Ticket Selection ---

class _TicketTypeCard extends StatelessWidget {
  final String type;
  final String price;
  final String description;
  final bool isSoldOut;

  const _TicketTypeCard({
    required this.type,
    required this.price,
    required this.description,
    this.isSoldOut = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSoldOut ? Colors.grey : Colors.black;

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    price,
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(color: Get.theme.primaryColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Get.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Stepper UI (Statis)
            isSoldOut
                ? Text('Habis', style: TextStyle(color: Colors.red[700]))
                : Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {}, // Dibiarkan kosong (statis)
                      ),
                      const Text('0', style: TextStyle(fontSize: 18)),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline,
                            color: Get.theme.primaryColor),
                        onPressed: () {}, // Dibiarkan kosong (statis)
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}