import '../controller/abilita_disabilita_classe_two_controller.dart';
import 'package:get/get.dart';

class AbilitaDisabilitaClasseTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbilitaDisabilitaClasseTwoController());
  }
}
