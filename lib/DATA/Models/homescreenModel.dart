import 'package:flutter/material.dart';

Map commonModel = {
  "drawer": {
    "attributes": {},
    "drawerHeader": {
      "headerColor": Colors.blueGrey[800],
      "headerIcon": Icons.account_circle,
    },
    "menuItems": [
      // {
      //   "title": "Profile",
      //   "titleStyle": TextStyle(
      //     color: Colors.blueGrey[900],
      //   ),
      //   "subtitle": " ",
      //   "leadingIcon": Icon(Icons.account_circle),
      //   "trailingIcon": Icon(Icons.more_vert),
      //   "action": () {}
      // },
      //
      {
        "title": "My Accounts",
        "titleStyle": TextStyle(
          color: Colors.blueGrey[900],
        ),
        "subtitle": " ",
        "leadingIcon": Icon(Icons.local_atm),
        "trailingIcon": Icon(Icons.more_vert),
        "action": "/myAccounts",
      },
      {
        "title": "Payees",
        "titleStyle": TextStyle(
          color: Colors.blueGrey[900],
        ),
        "subtitle": " ",
        "leadingIcon": Icon(Icons.contacts),
        "trailingIcon": Icon(Icons.more_vert),
        "action": "/payees",
      },
      {
        "title": "Transactions",
        "titleStyle": TextStyle(
          color: Colors.blueGrey[900],
        ),
        "subtitle": " ",
        "leadingIcon": Icon(Icons.payment),
        "trailingIcon": Icon(Icons.more_vert),
        "action": "/transactions",
      },
      {
        "title": "Logout",
        "titleStyle": TextStyle(
          color: Colors.blueGrey[900],
        ),
        "subtitle": " ",
        "leadingIcon": Icon(Icons.exit_to_app),
        "trailingIcon": Icon(Icons.more_vert),
        "action": () {}
      },
    ],
  },
  "bottomNav": {
    "bottomNavAttributes": {
      "backgroundColor": Colors.blueGrey[800],
      "type": BottomNavigationBarType.fixed,
      "selectedItemColor": Colors.white,
      "selectedLabelStyle": TextStyle(
        color: Colors.white,
      ),
      "unselectedItemColor": Colors.blueGrey,
      "unselectedLabelStyle": TextStyle(
        color: Colors.blueGrey,
      ),
    },
    "navBarItems": [
      {
        "icon": Icon(
          Icons.dashboard,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.dashboard, color: Colors.white),
        "label": "Dashboard"
      },
      {
        "icon": Icon(
          Icons.contacts,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.contacts, color: Colors.white),
        "label": "Payees"
      },
      {
        "icon": Icon(
          Icons.local_atm,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.local_atm, color: Colors.white),
        "label": "Accounts"
      },
      {
        "icon": Icon(
          Icons.payment,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.payment, color: Colors.white),
        "label": "Transactions"
      }
    ]
  },
  "tabs": [
    Tab(
      icon: Icon(Icons.attach_money),
    ),
    Tab(
      icon: Icon(Icons.shopping_cart),
    ),
    Tab(
      icon: Icon(Icons.list_alt),
    ),
    Tab(
      icon: Icon(Icons.history),
    ),
  ],
};
