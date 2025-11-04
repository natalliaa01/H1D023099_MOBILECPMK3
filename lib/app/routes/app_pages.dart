import 'package:get/get.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/my_tickets/bindings/my_tickets_binding.dart';
import '../modules/my_tickets/views/my_tickets_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/ticket_selection/bindings/ticket_selection_binding.dart';
import '../modules/ticket_selection/views/ticket_selection_view.dart';

part 'app_routes.dart'; // Mengambil nama rute dari file sebelah

class AppPages {
  AppPages._();

  // Rute awal saat aplikasi dibuka
  static const INITIAL = Routes.ONBOARDING;

  // Daftar semua halaman/rute
  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_SELECTION,
      page: () => const TicketSelectionView(),
      binding: TicketSelectionBinding(),
    ),
    GetPage(
      name: _Paths.MY_TICKETS,
      page: () => const MyTicketsView(),
      binding: MyTicketsBinding(),
    ),
  ];
}