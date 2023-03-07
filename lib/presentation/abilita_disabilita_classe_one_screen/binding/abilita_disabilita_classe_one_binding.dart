import '../controller/abilita_disabilita_classe_one_controller.dart';
import 'package:get/get.dart';

class AbilitaDisabilitaClasseOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbilitaDisabilitaClasseOneController());
  }
}
