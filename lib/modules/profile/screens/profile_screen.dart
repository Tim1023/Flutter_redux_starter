import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/common/screens/login_screen.dart';
import 'package:onigiri_app/modules/profile/containers/logout_button.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isAuthenticated) {
          return Center(child: LogoutButton());
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

class _ViewModel {
  final bool isAuthenticated;

  _ViewModel({
    @required this.isAuthenticated,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
    );
  }
}