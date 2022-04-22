import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solisoltask/utils/styles.dart';

typedef String? FieldValidator(String? data);

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final Color? fillColor;
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final Color? labelColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? focusBorderColor;
  final Color? unfocusBorderColor;
  final double? contentPadding;
  final bool? enable;
  final String? text;
  final String? sufixLabel;
  final onChanged;
  final double? leftPadding;
  final double? rightPadding;
  final TextEditingController? controller;
  final Function? focusListner;
  late FocusNode focusNode;
  final FieldValidator? validator;
  final TextInputType? keyboardType;
  final bool isDigitsOnly;
  final bool? obsecureText;
  final Widget? suffixIconWidet;
  TextDirection? textDirection;

  MyTextField(
      {this.textDirection,
      this.obsecureText,
      this.fillColor,
      this.labelText,
      this.hintText,
      this.hintColor,
      this.labelColor,
      this.prefixIcon,
      this.suffixIcon,
      this.focusBorderColor,
      this.unfocusBorderColor,
      this.onChanged,
      this.contentPadding,
      this.enable = true,
      this.isDigitsOnly = false,
      this.text,
      this.sufixLabel,
      this.leftPadding,
      this.rightPadding,
      this.controller,
      this.focusListner,
      this.validator,
      this.suffixIconWidet,
      this.keyboardType}) {
    focusNode = FocusNode();
    if (focusListner != null) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          focusListner!();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
      ),
      child: TextFormField(
        obscureText: obsecureText ?? false,
        controller: controller ?? TextEditingController(),
        inputFormatters:
            isDigitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
        keyboardType: keyboardType ?? TextInputType.text,
        enabled: enable,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding ?? 5),
          fillColor: fillColor ?? Colors.grey,
          suffixIcon: suffixIconWidet,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          labelStyle: TextStyle(color: labelColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: focusBorderColor ?? AppColor.green),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: focusBorderColor ?? AppColor.greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: unfocusBorderColor ?? AppColor.greyColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusBorderColor ?? AppColor.green),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final onPressed;
  final String text;
  final LinearGradient linearGradient;
  final Color? textColor;

  const RoundedButton(
      {required this.onPressed,
      required this.text,
      this.textColor,
      required this.linearGradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: Container(
        height: 48.0,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyles.textStyleBoldBodyMedium
                      .copyWith(color: textColor ?? Colors.black),
                ),
              )),
        ),
      ),
    );
  }
}
