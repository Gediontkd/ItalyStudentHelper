import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:michele_s_application8/core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({this.alignment, this.margin, this.value, this.onChanged});

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  bool? value;

  Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  _buildSwitchWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: value ?? false,
        height: getHorizontalSize(37),
        width: getHorizontalSize(70),
        toggleSize: 27,
        borderRadius: getHorizontalSize(
          18.00,
        ),
        activeColor: ColorConstant.lightBlueA400,
        activeToggleColor: ColorConstant.whiteA700,
        inactiveColor: ColorConstant.indigo100,
        inactiveToggleColor: ColorConstant.whiteA700,
        onToggle: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}
