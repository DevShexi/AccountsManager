import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyType;
  final bool obscure;
  final String label;
  final String hint;
  final String error;
  final entity;
  final Function changeHandler;
  InputField({
    this.keyType,
    this.obscure,
    @required this.label,
    this.hint,
    this.error,
    @required this.entity,
    @required this.changeHandler,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: entity['padding'],
      child: TextFormField(
        autofocus: false,
        keyboardType: keyType,
        onChanged: changeHandler,
        obscureText: obscure,
        // initialValue: "superadmin@admin.com",
        decoration: InputDecoration(
          labelText: label,
          // labelStyle: entity['decoration']['labelText'],
          hintText: hint,
          errorText: error != "" ? error : null,
          // hintStyle: entity['decoration']['hintStyle'],
          enabledBorder: entity['decoration']['enabledBorder'],
          focusedBorder: entity['decoration']['focusedBorder'],
          errorBorder: entity['decoration']['errorBorder'],
          focusedErrorBorder: entity['decoration']['focusedErrorBorder'],
        ),
      ),
    );
  }
}
