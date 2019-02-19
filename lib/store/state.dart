import 'package:meta/meta.dart';
import 'package:onigiri_app/modules/auth/store/state.dart';
import 'package:onigiri_app/modules/bottom_nav/store/state.dart';
import 'package:onigiri_app/modules/discovery/store/state.dart';

@immutable
class AppState {
  final AuthState authState;
  final NavState navState;
  final DiscoveryState discoveryState;

  AppState({
    @required this.authState,
    @required this.navState,
    this.discoveryState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      navState: NavState.initial(),
      discoveryState: DiscoveryState.initial(),
    );
  }
}