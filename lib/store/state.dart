import 'package:meta/meta.dart';
import 'package:onigiri_app/modules/auth/store/state.dart';
import 'package:onigiri_app/modules/bottom_nav/store/state.dart';

@immutable
class AppState {
  final AuthState authState;
  final NavState navState;

  AppState({
    @required this.authState,
    @required this.navState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      navState: NavState.initial(),
    );
  }
}