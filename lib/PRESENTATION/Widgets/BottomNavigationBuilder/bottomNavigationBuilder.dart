import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Map<String, dynamic> model;
  final int currentIndex;
  final void Function(int) onItemTap;

  BottomNavBar({
    @required this.model,
    @required this.currentIndex,
    @required this.onItemTap,
  }) {
    assert(model != null, "Bottom Navigation Model is Empty");
    assert(currentIndex != null, "Current Index is Empty");
    assert(onItemTap != null, "onTap callback method is Null");
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItem(items) {
    List<BottomNavigationBarItem> _items = [];
    items.forEach(
      (item) {
        _items.add(
          BottomNavigationBarItem(
            icon: item["icon"],
            activeIcon: item["activeIcon"],
            label: item["label"],
          ),
        );
      },
    );
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: model["bottomNavAttributes"]["backgroundColor"],
      type: model["bottomNavAttributes"]["type"],
      selectedItemColor: model["bottomNavAttributes"]["selectedItemColor"],
      selectedLabelStyle: model["bottomNavAttributes"]["selectedLabelStyle"],
      unselectedItemColor: model["bottomNavAttributes"]["unselectedItemColor"],
      unselectedLabelStyle: model["bottomNavAttributes"]
          ["unselectedLabelStyle"],
      items: getBottomNavigationBarItem(model['navBarItems']),
      currentIndex: currentIndex,
      onTap: onItemTap,
    );
  }
}
