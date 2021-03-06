import 'package:flutter/material.dart';
import 'package:myShop/DATA/repository/authRepository.dart';

class DrawerItem extends StatefulWidget {
  final action;
  final trailingIcon;
  final leadingIcon;
  final title;
  DrawerItem({
    this.title,
    this.trailingIcon,
    this.leadingIcon,
    this.action,
  }) {
    assert(title != null, "Title is Empty");
  }
  factory DrawerItem.fromJson(Map<String, dynamic> entity) => DrawerItem(
        action: entity["action"],
        // trailingIcon: entity["trailingIcon"],
        leadingIcon: entity["leadingIcon"],
        title: entity["title"],
      );

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  AuthenticationRepository authRepo = AuthenticationRepository();
  onLogout() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //    backgroundColor: kLight,
        title: Text(
          'You will be logged out from myShop',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () async {
              final revoked = await authRepo.logout();
              print("Revoked Status: $revoked");
              if (revoked) {
                print("Successfully Revoked!");
                Navigator.of(context).popAndPushNamed('/');
              } else
                print("Revoke Failed!");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: widget.trailingIcon,
        leading: widget.leadingIcon,
        title: Text(
          widget.title,
        ),
        onTap: widget.title == "Logout"
            ? onLogout
            : () {
                Navigator.pushNamed(context, widget.action);
              });
  }
}
