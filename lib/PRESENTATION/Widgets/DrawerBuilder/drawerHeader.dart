import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget {
  final headerColor;
  final headerIcon;
  Header({
    @required this.headerColor,
    @required this.headerIcon,
  });

  factory Header.fromJson(Map<String, dynamic> entity) => new Header(
        headerColor: entity["headerColor"],
        headerIcon: entity["headerIcon"],
      );

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String email;
  @override
  void initState() {
    super.initState();
  }

  fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _email = prefs.getString("email");
    setState(() {
      email = _email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: widget.headerColor,
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Icon(
                    widget.headerIcon,
                    color: Colors.white,
                    size: 42,
                  ),
                  email != null
                      ? Text(
                          '$email'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // fontSize: 16,
                              fontWeight: FontWeight.w900),
                        )
                      : Text(
                          'Shahzad',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
