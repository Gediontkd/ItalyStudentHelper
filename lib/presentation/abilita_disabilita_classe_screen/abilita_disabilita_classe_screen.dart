import 'controller/abilita_disabilita_classe_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';
import 'package:michele_s_application8/widgets/custom_button.dart';
import 'package:michele_s_application8/widgets/custom_switch.dart';

class AbilitaDisabilitaClasseScreen
    extends GetWidget<AbilitaDisabilitaClasseController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray200,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              decoration: AppDecoration.fillGray200,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding: getPadding(right: 20, top:10),
                                            child: Text("lbl_powered_by".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtRobotoRomanMedium10))),
                                    CustomImageView(
                                        imagePath:
                                        ImageConstant
                                            .imgImage1,
                                        margin: getMargin(right:20),
                                        height:
                                        getVerticalSize(
                                            21),
                                        width:
                                        getHorizontalSize(
                                            103),
                                        alignment: Alignment
                                            .centerRight),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgRectangle286,
                                                  height:
                                                  getVerticalSize(133),
                                                  width: getHorizontalSize(
                                                      134),
                                                  margin:
                                                  getMargin(top: 20)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 15, bottom: 20, top:25),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                            width:
                                                            getHorizontalSize(
                                                                109),
                                                            margin:
                                                            getMargin(
                                                                top:
                                                                34),
                                                            child: Text(
                                                                "msg_istituto_comprensivo"
                                                                    .tr,
                                                                maxLines:
                                                                null,
                                                                textAlign:
                                                                TextAlign
                                                                    .right,
                                                                style: AppStyle
                                                                    .txtRobotoRomanSemiBold19)),
                                                        Padding(
                                                            padding:
                                                            getPadding(
                                                                top: 6),
                                                            child: Text(
                                                                "lbl_dante_alighieri"
                                                                    .tr,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign
                                                                    .right,
                                                                style: AppStyle
                                                                    .txtRobotoRomanSemiBold19Lime600))
                                                      ]))
                                            ])),
                                    Padding(
                                      padding: getPadding(top: 25),),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                            getPadding(left: 41),
                                            child: Text(
                                                "msg_collegamento_ad".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold24Black900))),
                                    Container(
                                        margin: getMargin(
                                            left: 16, top: 10, right: 15),
                                        padding:
                                        getPadding(top: 25, bottom: 25),
                                        decoration: AppDecoration.fillWhiteA700
                                            .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 31, right: 13),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5,
                                                                bottom: 2),
                                                            child: Text(
                                                                "lbl_classe_1_c"
                                                                    .tr,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign
                                                                    .left,
                                                                style: AppStyle
                                                                    .txtRobotoRomanSemiBold24Black900)),
                                                        Obx(() => CustomSwitch(
                                                            value: controller
                                                                .isSelectedSwitch
                                                                .value,
                                                            onChanged: (value) {
                                                              controller
                                                                  .isSelectedSwitch
                                                                  .value = value;
                                                            }))
                                                      ])),
                                              Padding(
                                                  padding: getPadding(top: 19),
                                                  child: Divider(
                                                      color: ColorConstant
                                                          .gray200)),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 28,
                                                          top: 18,
                                                          right: 16),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                getPadding(
                                                                    top: 3,
                                                                    bottom:
                                                                    4),
                                                                child: Text(
                                                                    "lbl_classe_2_c"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanSemiBold24Black900)),
                                                            Obx(() =>
                                                                CustomSwitch(
                                                                    value: controller
                                                                        .isSelectedSwitch1
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .isSelectedSwitch1
                                                                          .value = value;
                                                                    }))
                                                          ]))),
                                              Padding(
                                                  padding: getPadding(top: 19),
                                                  child: Divider(
                                                      color: ColorConstant
                                                          .gray200)),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 28,
                                                          top: 22,
                                                          right: 16),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                getPadding(
                                                                    bottom:
                                                                    8),
                                                                child: Text(
                                                                    "lbl_visori_3d"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanSemiBold24Black900)),
                                                            Obx(() =>
                                                                CustomSwitch(
                                                                    value: controller
                                                                        .isSelectedSwitch2
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .isSelectedSwitch2
                                                                          .value = value;
                                                                    }))
                                                          ]))),
                                              Padding(
                                                  padding: getPadding(top: 20),
                                                  child: Divider(
                                                      color: ColorConstant
                                                          .gray200)),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 27,
                                                          top: 17,
                                                          right: 15),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                getPadding(
                                                                    top: 2,
                                                                    bottom:
                                                                    5),
                                                                child: Text(
                                                                    "msg_lab_di_informatica"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanSemiBold24Black900)),
                                                            Obx(() =>
                                                                CustomSwitch(
                                                                    value: controller
                                                                        .isSelectedSwitch3
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .isSelectedSwitch3
                                                                          .value = value;
                                                                    }))
                                                          ])))
                                            ])),
                                  ])))
                    ])),
            bottomNavigationBar: Container(
                height: getVerticalSize(145),
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: getVerticalSize(170),
                          width: double.maxFinite,
                          decoration:
                          BoxDecoration(color: ColorConstant.blueGray50))),
                  Column(
                      children: [
                        CustomButton(
                            text: "lbl_scollega_tutti".tr,
                            onTap: () {
                              controller.isSelectedSwitch.value = false;
                              controller.isSelectedSwitch1.value = false;
                              controller.isSelectedSwitch2.value = false;
                              controller.isSelectedSwitch3.value = false;
                            },
                            margin: getMargin(
                                left: 16, top: 10, right: 15, bottom:10)
                        ),
                        CustomButton(
                            width: getHorizontalSize(344),
                            text: "lbl_indietro".tr,
                            variant: ButtonVariant.GradientGray5008eBluegray400af,
                            onTap: onBackPressed,
                            alignment: Alignment.topCenter)
                      ])
                ]))));
  }

  onBackPressed() {
    Get.back();
  }
}
