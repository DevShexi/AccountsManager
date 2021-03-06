import 'package:flutter/material.dart';

Map formFieldsModel = {
  "outlinedInputField": {
    "padding": const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    "decoration": {
      "labelStyle": TextStyle(color: Colors.blueGrey[300]),
      "hintStyle": TextStyle(color: Colors.blueGrey[800]),
      "enabledBorder": OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[800]),
      ),
      "focusedBorder": OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[800]),
      ),
      "errorBorder": OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[800]),
      ),
      "focusedErrorBorder": OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[800]),
      ),
    },
  },
  "actionButton": {
    "padding": const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    "width": double.infinity,
    "height": 55.0,
    "raisedButton": {
      "color": Colors.blueGrey[800],
      "titleStyle": TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    },
  },
};
