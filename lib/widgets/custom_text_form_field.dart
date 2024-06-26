import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final OutlineInputBorder? shape;
  final EdgeInsetsGeometry? padding;
  final String? variant;
  final TextStyle? fontStyle;
  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final FormFieldValidator<String>? validator;
  final InputDecoration decoration;

  CustomTextFormField({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.validator,
    this.decoration = const InputDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment!,
      child: _buildTextFormFieldWidget(),
    )
        : _buildTextFormFieldWidget();
  }

  Widget _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: fontStyle,
        obscureText: isObscureText!,
        textInputAction: textInputAction!,
        keyboardType: textInputType!,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      hintText: hintText,
      hintStyle: fontStyle,
      border: shape ?? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2),
      ),
      contentPadding: padding,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints,
    );
  }
}
