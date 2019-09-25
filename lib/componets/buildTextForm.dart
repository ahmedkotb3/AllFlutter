import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Container buildTextForm(
  TextEditingController takeInput,
  String oldData, [
  String sideText,
  Icon sideIcon,
  TextInputType mytype,
  bool secret = false,
  bool bordeRradius = true,
  int lines,
  bool Enabled = true,
  int length,
]) {
  return new Container(
    decoration: BoxDecoration(
      border: Border.all(color: ColorProvider().primary),
      borderRadius: bordeRradius
          ? BorderRadius.circular(5.0)
          : BorderRadius.circular(0.0),
    ),
    child: TextFormField(
      enabled: Enabled,
      decoration: InputDecoration(
        suffixText: sideText,
        hintText: oldData,
        suffixIcon: sideIcon,
        contentPadding: EdgeInsets.all(15.0),
      ),
      obscureText: secret,
      keyboardType: mytype,
      maxLines: lines,
      inputFormatters: [
        LengthLimitingTextInputFormatter(length)],
      controller: takeInput,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: ColorProvider().primary),
    ),
  );
}
