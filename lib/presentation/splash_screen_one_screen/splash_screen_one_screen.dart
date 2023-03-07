import 'controller/splash_screen_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';

class SplashScreenOneScreen extends GetWidget<SplashScreenOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(all: 14),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(right: 6),
                          child: Text("lbl_powered_by".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanMedium10)),
                      CustomImageView(
                          imagePath: ImageConstant.imgImage1,
                          height: getVerticalSize(21),
                          width: getHorizontalSize(103),
                          margin: getMargin(right: 6)),
                      Spacer(),
                      Container(
                          height: getVerticalSize(352),
                          width: getHorizontalSize(345),
                          margin: getMargin(right: 1, bottom: 215),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(352),
                                    width: getHorizontalSize(345),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA7009e,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(176))))),
                            Align(
                                alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                          ImageConstant.imgRectangle286,
                                          height: getVerticalSize(133),
                                          width: getHorizontalSize(134)),
                                      Padding(
                                          padding: getPadding(
                                              left: 6, top: 148, bottom: 20),
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width:
                                                    getHorizontalSize(113),
                                                    child: Text(
                                                        "msg_istituto_comprensivo"
                                                            .tr,
                                                        maxLines: null,
                                                        textAlign:
                                                        TextAlign.right,
                                                        style: AppStyle
                                                            .txtRobotoRomanSemiBold19)),
                                                Padding(
                                                    padding: getPadding(top: 6),
                                                    child: Text(
                                                        "lbl_dante_alighieri"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: AppStyle
                                                            .txtRobotoRomanSemiBold19Lime600))
                                              ]))
                                    ]))
                          ]))
                    ]))));
  }
}
