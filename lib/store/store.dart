
import 'package:onigiri_app/modules/auth/store/middleware.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';
import 'package:onigiri_app/store/reducers.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducers,
    initialState: AppState.initial(),
    middleware: []
      ..addAll(AuthMiddleware().createAuthMiddleware())
      ..addAll(AppMiddleware().createAppMiddleware()),
  );
}

class AppMiddleware {

  AppMiddleware();

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
    ];
  }

  void _logAction(
      Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    print(action);
  }
}