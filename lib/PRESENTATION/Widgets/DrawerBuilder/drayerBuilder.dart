import 'package:flutter/material.dart';
import 'package:myShop/DATA/Models/homescreenModel.dart';

import 'drawerHeader.dart';
import 'drawerItem.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Header.fromJson(commonModel["drawer"]["drawerHeader"]),
          ListView.builder(
            // separatorBuilder: (context, index) => Divider(
            //   color: Colors.grey[400],
            // ),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            //itemCount: 83,
            itemCount: commonModel["drawer"]["menuItems"].length,
            itemBuilder: (context, index) =>
                DrawerItem.fromJson(commonModel["drawer"]["menuItems"][index]),
          ),
        ],
      ),
    );
  }
}
