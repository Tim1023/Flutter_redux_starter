import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/discovery/screens/discovery_screen.dart';


@immutable
class NavState {
  final int selectedBottomNav;
  final Widget rootScreen;

  NavState({
    @required this.selectedBottomNav,
    @required this.rootScreen,
  });

  factory NavState.initial() {
    return NavState(
      selectedBottomNav: 0,
      rootScreen: DiscoveryPage(),
    );
  }

  NavState copyWith({
    int selectedBottomNav,
    Widget rootScreen,
  }) {
    return NavState(
      selectedBottomNav: selectedBottomNav ?? this.selectedBottomNav,
      rootScreen: rootScreen ?? this.rootScreen,
    );
  }
}