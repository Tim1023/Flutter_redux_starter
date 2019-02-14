import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/modules/auth/store/actions.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';



class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return RaisedButton(
            child: Text('Logout'),
            onPressed: viewModel.onPressed
        );
      },
    );
  }
}

class _ViewModel {
  final Function() onPressed;

  _ViewModel({this.onPressed});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        onPressed: () {
          store.dispatch(UserLogout());
        }
    );
  }
}