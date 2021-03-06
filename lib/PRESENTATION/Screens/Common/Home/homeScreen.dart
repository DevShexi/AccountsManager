import 'package:flutter/material.dart';
import 'package:myShop/DATA/Models/homescreenModel.dart';
import 'package:myShop/DATA/repository/authRepository.dart';
import 'package:myShop/PRESENTATION/Screens/Accounts/addAccount.dart';
import 'package:myShop/PRESENTATION/Screens/Accounts/myAccounts.dart';
import 'package:myShop/PRESENTATION/Screens/Dashboard/dashboard.dart';
import 'package:myShop/PRESENTATION/Screens/Payees/payees.dart';
import 'package:myShop/PRESENTATION/Screens/Transactions/allTransactions.dart';
import 'package:myShop/PRESENTATION/Widgets/DrawerBuilder/drayerBuilder.dart';
import 'package:myShop/PRESENTATION/Widgets/BottomNavigationBuilder/bottomNavigationBuilder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "UserName";
  String title = 'Dashboard';
  int selectedIndex = 0;
  AuthenticationRepository authRepo = AuthenticationRepository();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      addAccountDialogue();
    });
  }

  addAccountDialogue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String later = prefs.getString("later");
    // print(later);
    if (later == null || later == "true") {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height * (2 / 3),
            child: AddAccount(
              flag: true,
            ),
          ),
        ),
      );
    }
  }

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> options = <Widget>[
    Dashboard(),
    Payees(),
    MyAccounts(),
    Transactions(),
  ];

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
              try {
                final revoked = await authRepo.logout();
                if (revoked) {
                  Navigator.of(context).popAndPushNamed('/');
                }
              } catch (e) {
                print('Exception During Sign Out: $e');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        // appBar: AppBar(
        //     automaticallyImplyLeading: false,
        //     centerTitle: true,
        //     title: Text(
        //       '$title',
        //       style: TextStyle(
        //         color: Colors.white,
        //         //fontWeight: FontWeight.bold,
        //       ),
        //     )),
        body: Center(
          child: options.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavBar(
            model: commonModel["bottomNav"],
            currentIndex: selectedIndex,
            onItemTap: onItemTap));
  }
}
