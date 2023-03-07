import 'package:michele_s_application8/core/app_export.dart';
import 'package:michele_s_application8/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController masterfieldController = TextEditingController();

  TextEditingController masterfieldOneController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    masterfieldController.dispose();
    masterfieldOneController.dispose();
  }
}
