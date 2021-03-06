import 'package:flutter/material.dart';
import 'package:myShop/DATA/transactions.dart';
import 'package:myShop/PRESENTATION/Widgets/Transactions/transactionCard.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('All Transactions'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) => TransactionCard.fromJson(
            transactions[index],
          ),
        ),
      ),
    );
  }
}
