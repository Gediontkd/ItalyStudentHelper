import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';
import 'package:michele_s_application8/core/utils/validation_functions.dart';
import 'package:michele_s_application8/widgets/custom_button.dart';
import 'package:michele_s_application8/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 23, top: 11, right: 23, bottom: 11),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(right: 1),
                                  child: Text("lbl_powered_by".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanMedium10))),
                          CustomImageView(
                              imagePath: ImageConstant.imgImage1,
                              height: getVerticalSize(21),
                              width: getHorizontalSize(103),
                              alignment: Alignment.centerRight),
                          Padding(
                              padding: getPadding(left: 32, top: 25, right: 30),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle286,
                                    height: getVerticalSize(133),
                                    width: getHorizontalSize(134)),
                                Padding(
                                    padding: getPadding(
                                        left: 10, top: 32, bottom: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: getHorizontalSize(113),
                                              child: Text(
                                                  "msg_istituto_comprensivo".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.right,
                                                  style: AppStyle
                                                      .txtRobotoRomanSemiBold19)),
                                          Padding(
                                              padding: getPadding(top: 6),
                                              child: Text(
                                                  "lbl_dante_alighieri".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanSemiBold19Lime600))
                                        ]))
                              ])),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Divider(color: ColorConstant.whiteA700)),
                          Spacer(),
                          Padding(
                              padding: getPadding(left: 5),
                              child: Text("lbl_login".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtRobotoRomanSemiBold19Black900)),
                          Padding(
                              padding: getPadding(left: 6, top: 43),
                              child: Text("lbl_username".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium1324)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.masterfieldController,
                              hintText: "msg_inserisci_il_tuo".tr,
                              margin: getMargin(left: 5, top: 12, right: 10),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(left: 6, top: 10),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium1324)),
                          Obx(() => CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.masterfieldOneController,
                              hintText: "msg_inserisci_la_password".tr,
                              margin: getMargin(left: 7, top: 12, right: 8),
                              padding: TextFormFieldPadding.PaddingT13,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 12,
                                          bottom: 18),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(46)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: !controller.isShowPassword.value)),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 10, right: 10),
                                  child: Text("msg_password_dimenticata".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanLight984))),
                          CustomButton(
                              text: "lbl_login".tr,
                              margin: getMargin(
                                  left: 6, top: 26, right: 7, bottom: 175),
                              variant: ButtonVariant.OutlineBlack9003f,
                              padding: ButtonPadding.PaddingAll9,
                              onTap: navigateToHome)
                        ])))));
  }

  navigateToHome() {
    Get.toNamed(AppRoutes.abilitaDisabilitaClasseTwoScreen);
  }
}
