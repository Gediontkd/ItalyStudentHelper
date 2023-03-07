import 'controller/abilita_disabilita_classe_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';

class AbilitaDisabilitaClasseTwoScreen
    extends GetWidget<AbilitaDisabilitaClasseTwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                              margin: getMargin(bottom: 2),
                              padding: getPadding(
                                  left: 24, top: 11, right: 24, bottom: 11),
                              decoration: AppDecoration.fillGray200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding: getPadding(),
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
                                        child: Divider(
                                            color: ColorConstant.whiteA700)),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          navigateToMyDevices();
                                        },
                                        child: Container(
                                            margin:
                                            getMargin(left: 5, right: 5),
                                            padding: getPadding(
                                                left: 82,
                                                top: 18,
                                                right: 82,
                                                bottom: 18),
                                            decoration: AppDecoration
                                                .outlineBlack9003f
                                                .copyWith(
                                                borderRadius:
                                                BorderRadiusStyle
                                                    .roundedBorder14),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: getHorizontalSize(
                                                          152),
                                                      child: Text(
                                                          "msg_gestisci_i_miei"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: AppStyle
                                                              .txtRobotoRomanSemiBold24))
                                                ]))),
                                    GestureDetector(
                                        onTap: () {
                                          navigateToMyGroups();
                                        },
                                        child: Container(
                                            margin: getMargin(
                                                left: 5,
                                                top: 30,
                                                right: 5,
                                                bottom: 200),
                                            padding: getPadding(
                                                left: 82,
                                                top: 17,
                                                right: 82,
                                                bottom: 17),
                                            decoration: AppDecoration
                                                .outlineBlack9003f
                                                .copyWith(
                                                borderRadius:
                                                BorderRadiusStyle
                                                    .roundedBorder14),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: getHorizontalSize(
                                                          152),
                                                      margin: getMargin(top: 3),
                                                      child: Text(
                                                          "msg_gestisci_i_miei2"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: AppStyle
                                                              .txtRobotoRomanSemiBold24))
                                                ])))
                                  ])))
                    ]))));
  }

  navigateToMyDevices() {
    Get.toNamed(AppRoutes.abilitaDisabilitaClasseOneScreen);
  }

  navigateToMyGroups() {
    Get.toNamed(AppRoutes.abilitaDisabilitaClasseScreen);
  }
}
