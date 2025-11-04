part of 'app_pages.dart'; // Ini akan terhubung ke app_pages.dart

// JANGAN UBAH NAMA ABSTRACT CLASS INI
abstract class Routes {
  Routes._(); // private constructor

  // Definisikan nama rute di sini
  static const ONBOARDING = _Paths.ONBOARDING;
  static const HOME = _Paths.HOME;
  static const EVENT_DETAIL = _Paths.EVENT_DETAIL;
  static const TICKET_SELECTION = _Paths.TICKET_SELECTION;
  static const MY_TICKETS = _Paths.MY_TICKETS;
}

// JANGAN UBAH NAMA ABSTRACT CLASS INI
abstract class _Paths {
  _Paths._(); // private constructor

  // Definisikan path rute di sini
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const EVENT_DETAIL = '/event-detail';
  static const TICKET_SELECTION = '/ticket-selection';
  static const MY_TICKETS = '/my-tickets';
}