import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens/app.dart';
import './bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}
