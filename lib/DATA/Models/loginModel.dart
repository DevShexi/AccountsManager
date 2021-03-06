import 'package:flutter/material.dart';

//This is the Model for Login Screen
Map loginModel = {
  "email_field": {
    "padding": const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    "obscureText": false,
    'initialValue': 'shexiakram@gmail.com',
    "decoration": {
      "labelText": "Email",
      "labelStyle": TextStyle(color: Colors.blueGrey[300]),
      "hintText": "email@example.com",
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
  "password_field": {
    "padding": const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    "obscureText": true,
    'initialValue': '123456',
    "decoration": {
      "labelText": "Password",
      "labelStyle": TextStyle(color: Colors.blueGrey[300]),
      "hintText": "Atleast 6 characters",
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
  "login_action": {
    "padding": const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    "width": double.infinity,
    "height": 55.0,
    "raisedButton": {
      "color": Colors.blueGrey[800],
      "name": 'LOGIN',
      "titleStyle": TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    },
  },
};
