import 'package:michele_s_application8/core/app_export.dart';
import 'package:michele_s_application8/presentation/splash_screen_one_screen/models/splash_screen_one_model.dart';

class SplashScreenOneController extends GetxController {
  Rx<SplashScreenOneModel> splashScreenOneModelObj = SplashScreenOneModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.loginScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
