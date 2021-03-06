import 'package:flutter/material.dart';
import 'package:myShop/DATA/accounts.dart';
import 'package:myShop/PRESENTATION/Screens/Accounts/addAccount.dart';
import 'package:myShop/PRESENTATION/Widgets/AccountsBuilder/accountsBuilder.dart';

class MyAccounts extends StatefulWidget {
  @override
  _MyAccountsState createState() => _MyAccountsState();
}

class _MyAccountsState extends State<MyAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height * (2 / 3),
                child: AddAccount(
                  flag: false,
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("My Accounts"),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            AccountsBuilder(
              accountsList: accounts,
            ),
          ],
        ),
      ),
    );
  }
}
