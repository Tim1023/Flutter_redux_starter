import 'package:onigiri_app/modules/auth/store/actions.dart';
import 'package:onigiri_app/modules/auth/store/repository.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthMiddleware {
  final Repository repository;

  const AuthMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AppStarted>(_appStarted),
      TypedMiddleware<AppState, UserLoginRequest>(_login),
      TypedMiddleware<AppState, UserLoginSuccess>(_loginSuccess),
      TypedMiddleware<AppState, UserLogout>(_logout),
    ];
  }

  void _appStarted(Store<AppState> store, AppStarted action, NextDispatcher next) async {
    next(action);

    if (await _hasToken()) {
      store.dispatch(UserLoaded(
          user: User(token: await _getToken())
      ));
    }

  }


  void _login(Store<AppState> store, UserLoginRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData = await repository.login(action.email, action.password);
      _persistToken(authData['user']['token']);
      store.dispatch(UserLoginSuccess(
          user: authData['user']
      ));
    } catch (e) {
      store.dispatch(UserLoginFailure(error: e.toString()));
    }
  }

  void _loginSuccess(Store<AppState> store, UserLoginSuccess action, NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(
        user: User(
          token: action.user['token'],
          username: action.user['username'],
          email: action.user['email'],
          avatar: action.user['image'],
        )
    ));
  }

  void _logout(Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteToken();

    next(action);
  }


  /// HELPER FUNCTIONS

  Future<String> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print('Token removed');
  }

  Future<void> _persistToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print('Token: $token');
  }

  Future<bool> _hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';

    if (token != '') {
      return true;
    } else {
      return false;
    }
  }
}