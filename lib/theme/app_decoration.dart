import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1.11,
          ),
          colors: [
            ColorConstant.blueA400,
            ColorConstant.blue600E8,
          ],
        ),
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius roundedBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14,
    ),
  );
}
