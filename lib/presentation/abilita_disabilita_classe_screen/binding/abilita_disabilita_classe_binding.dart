import '../controller/abilita_disabilita_classe_controller.dart';
import 'package:get/get.dart';

class AbilitaDisabilitaClasseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbilitaDisabilitaClasseController());
  }
}
