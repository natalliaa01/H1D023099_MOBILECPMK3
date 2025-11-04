import 'package:get/get.dart';
import '../controllers/ticket_selection_controller.dart';

class TicketSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketSelectionController>(
      () => TicketSelectionController(),
    );
  }
}