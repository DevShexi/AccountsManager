import 'package:flutter/material.dart';

getPopupManuButton() {
  List<String> choices = <String>[
    "Profile Settings",
    "Business Settings",
    "History"
  ];
  return PopupMenuButton<String>(
    onSelected: popupMenuAction,
    itemBuilder: (BuildContext context) {
      return choices.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
  );
}

void popupMenuAction(String action) {
  print("working");
}
