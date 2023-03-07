import 'package:michele_s_application8/core/app_export.dart';
import 'package:michele_s_application8/presentation/abilita_disabilita_classe_one_screen/models/abilita_disabilita_classe_one_model.dart';

class AbilitaDisabilitaClasseOneController extends GetxController {
  Rx<AbilitaDisabilitaClasseOneModel> abilitaDisabilitaClasseOneModelObj =
      AbilitaDisabilitaClasseOneModel().obs;

  RxBool isSelectedSwitch = false.obs;

  RxBool isSelectedSwitch1 = false.obs;

  RxBool isSelectedSwitch2 = false.obs;

  RxBool isSelectedSwitch3 = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
