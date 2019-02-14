import 'package:onigiri_app/store/state.dart';
import 'package:onigiri_app/modules/auth/store/reducers.dart';
import 'package:onigiri_app/modules/bottom_nav/store/reducers.dart';

AppState appReducers(AppState state, dynamic action) {
  return AppState(
    authState: authReducers(state.authState, action),
    navState: navReducers(state.navState, action),
  );
}