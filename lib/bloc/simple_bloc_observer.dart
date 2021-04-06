import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Bloc Log >>> $transition');

    super.onTransition(bloc, transition);
  }
}
