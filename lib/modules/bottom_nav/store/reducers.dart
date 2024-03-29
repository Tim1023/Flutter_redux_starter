import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/bottom_nav/store/actions.dart';
import 'package:onigiri_app/modules/bottom_nav/store/state.dart';
import 'package:onigiri_app/modules/deals/screens/deals_screen.dart';
import 'package:onigiri_app/modules/discovery/screens/discovery_screen.dart';
import 'package:onigiri_app/modules/profile/screens/profile_screen.dart';
import 'package:onigiri_app/modules/merchants/screens/merchants_screen.dart';

import 'package:redux/redux.dart';

Reducer<NavState> navReducers = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  Widget rootScreen = state.rootScreen;
  switch (action.index) {
    case 0:
      {
        rootScreen = DiscoveryPage();
        break;
      }
    case 1:
      {
      rootScreen = MerchantsPage();
      break;
      }
    case 3:
      {
        rootScreen = DealsPage();
        break;
      }
    case 4:
      {
        rootScreen = ProfileScreen();
        break;
      }
  }
  return state.copyWith(
    selectedBottomNav: action.index,
    rootScreen: rootScreen,
  );
}
