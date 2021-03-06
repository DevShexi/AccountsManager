import "package:flutter/material.dart";

class TotalBalanceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * ((.6 / 5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 30,
              backgroundImage: AssetImage("images/shexi.jpg"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '987,675,654',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //   color: Colors.teal,
      // ),
    );
  }
}
