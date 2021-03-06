import 'package:flutter/material.dart';
import 'package:myShop/DATA/accounts.dart';
import 'package:myShop/PRESENTATION/Widgets/DashboardBuilder/accountwidget.dart';

class AccountsWidgetBuilder extends StatelessWidget {
  _addAccountWidgets() {
    List<Widget> acc = [];
    acc.add(SizedBox(width: 4));
    for (int i = 0; i < 3; i++) {
      acc.add(
        AccountWidget(
          ammount: accounts[i]["totalBalance"],
          name: accounts[i]["accountName"],
          number: accounts[i]["accountNumber"],
        ),
      );
    }
    acc.add(SizedBox(width: 4));
    return acc;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.grey[300],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 36),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/myAccounts");
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Accounts",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _addAccountWidgets(),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Container(
            // height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/transactions");
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
