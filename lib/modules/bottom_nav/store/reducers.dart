import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/bottom_nav/store/actions.dart';
import 'package:onigiri_app/modules/bottom_nav/store/state.dart';
import 'package:onigiri_app/modules/discovery/screens/discovery_screen.dart';
import 'package:onigiri_app/modules/profile/screens/profile_screen.dart';
import 'package:redux/redux.dart';


Reducer<NavState> navReducers = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  Widget rootScreen = state.rootScreen;
  if (action.index == 0) {
    rootScreen = DiscoveryPage();
  } else if (action.index == 1) {
    rootScreen = DiscoveryPage();
  } else if (action.index == 2) {
    rootScreen = ProfileScreen();
  }
  return state.copyWith(
    selectedBottomNav: action.index,
    rootScreen: rootScreen,
  );
}