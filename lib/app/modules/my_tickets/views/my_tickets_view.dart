import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import package QR
import '../controllers/my_tickets_controller.dart';

class MyTicketsView extends GetView<MyTicketsController> {
  const MyTicketsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _PurchasedTicketCard(
            event: 'Blackpink World Tour',
            date: '2 Des 2025',
            location: 'Stadion Utama, Jakarta',
            ticketType: 'VIP (x1)',
            qrData: 'EVENT-123-VIP', 
          ),
          _PurchasedTicketCard(
            event: 'Indonesian Idol Live Show',
            date: '28 Mar 2026',
            location: 'X1 Studio, Jakarta',
            ticketType: 'Reguler (x2)',
            qrData: 'EVENT-456-REG', // Data statis untuk QR
          ),
        ],
      ),
    );
  }
}

// --- Widget Lokal untuk Halaman My Tickets ---

class _PurchasedTicketCard extends StatelessWidget {
  final String event;
  final String date;
  final String location;
  final String ticketType;
  final String qrData;

  const _PurchasedTicketCard({
    required this.event,
    required this.date,
    required this.location,
    required this.ticketType,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Kolom Teks Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event,
                    style: Get.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(date, style: Get.textTheme.bodyMedium),
                  Text(location, style: Get.textTheme.bodyMedium),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(ticketType),
                    backgroundColor: Get.theme.primaryColor.withOpacity(0.1),
                    labelStyle: TextStyle(color: Get.theme.primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Kolom QR Code Placeholder
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 80.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}