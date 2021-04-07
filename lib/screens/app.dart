import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication.dart';
import '../screens/login_page/login_page.dart';
import '../screens/home_page/home_page.dart';
import '../bloc/login/login_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authenticationBloc = AuthenticationBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _authenticationBloc,
          child: AppView(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(
            authenticationBloc: _authenticationBloc,
          ),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, _) {
        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                return HomePage();

              default:
                return LoginPage();
            }
          },
        );
      },
    );
  }
}
