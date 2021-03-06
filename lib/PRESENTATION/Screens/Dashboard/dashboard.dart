import 'package:flutter/material.dart';
import 'package:myShop/DATA/transactions.dart';
import 'package:myShop/PRESENTATION/Widgets/DashboardBuilder/AccountsWidgetBuilder/accountsWidgetsBuilder.dart';
import 'package:myShop/PRESENTATION/Widgets/DashboardBuilder/totalBalanceInfo.dart';
import 'package:myShop/PRESENTATION/Widgets/Transactions/transactionCard.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("DashBoard"),
      ),
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            TotalBalanceInfo(),
            AccountsWidgetBuilder(),
            Expanded(
              child: Container(
                width: double.infinity,
                // color: Colors.teal,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      TransactionCard.fromJson(transactions[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
