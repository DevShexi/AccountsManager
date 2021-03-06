import 'package:flutter/material.dart';
import 'package:myShop/BLOC/AuthBloc/auth_bloc.dart';
import 'package:myShop/PRESENTATION/Screens/Accounts/addAccount.dart';
import 'package:myShop/PRESENTATION/Screens/Accounts/myAccounts.dart';
import 'package:myShop/PRESENTATION/Screens/Payees/payees.dart';
import 'package:myShop/PRESENTATION/Screens/Transactions/allTransactions.dart';
import '../../BLOC/LoginBloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Screens/welcome.dart';
import '../Screens/Auth/Login/login.dart';
import '../Screens/Common/Home/homeScreen.dart';

class AppRouter {
  final LoginBloc _loginBloc = LoginBloc();
  final AuthBloc _authBloc = AuthBloc();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _authBloc),
              BlocProvider.value(value: _loginBloc),
            ],
            // child: Payees(),
            // child: AddAccount(),
            child: Welcome(),
          ),
        );
        break;
      case '/addAccount':
        return MaterialPageRoute(
          builder: (_) => AddAccount(),
        );
        break;

      case '/myAccounts':
        return MaterialPageRoute(
          builder: (_) => MyAccounts(),
        );
        break;
      case '/payees':
        return MaterialPageRoute(
          builder: (_) => Payees(),
        );
        break;
      case '/transactions':
        return MaterialPageRoute(
          builder: (_) => Transactions(),
        );
        break;
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginBloc,
            child: Login(),
          ),
        );
        break;
      case '/home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginBloc,
            child: Home(),
          ),
        );
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _loginBloc.close();
    _authBloc.close();
  }
}
