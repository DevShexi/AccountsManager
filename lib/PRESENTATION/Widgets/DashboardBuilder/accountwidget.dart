import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final ammount;
  final name;
  final number;
  AccountWidget({this.ammount, this.name, this.number});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          // color: Colors.teal,
          // width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RS',
                      style: TextStyle(
                        fontSize: 10,
                        // color: Colors.white,
                      ),
                    ),
                    Text(
                      '$ammount',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: name != "Inhand Cash"
                      ? [
                          Text(
                            '$name',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 10,
                              // color: Colors.white,
                            ),
                          ),
                          Text(
                            '$number',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 10,
                              // color: Colors.white,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            '$name',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 10,
                              // color: Colors.white,
                            ),
                          ),
                        ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
