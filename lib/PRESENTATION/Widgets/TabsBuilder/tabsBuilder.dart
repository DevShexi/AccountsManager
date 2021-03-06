import 'package:flutter/material.dart';

getTabBar(model, List<Widget> widgets) {
  return (DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: TabBar(
            tabs: model['tabs'],
          ),
        ),
      ),
      body: TabBarView(
        children: widgets,
        // [
        //   Icon(Icons.attach_money),
        //   Icon(Icons.shopping_cart),
        //   Icon(Icons.list_alt),
        //   Icon(Icons.history),
        // ],
      ),
    ),
  ));
}
