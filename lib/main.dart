import 'package:flutter/material.dart';

import 'screens/app.dart';
import './bloc/authentication/authentication.dart';
import './bloc/user/user.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
