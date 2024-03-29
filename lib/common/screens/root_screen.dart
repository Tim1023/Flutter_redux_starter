import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onigiri_app/modules/auth/store/actions.dart';
import 'package:onigiri_app/store/state.dart';
import 'package:redux/redux.dart';


class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (Store<AppState> store) => store.dispatch(AppStarted()),
      // distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          child: viewModel.rootScreen,
        );
      },
    );
  }
}

class _ViewModel {
  final Widget rootScreen;

  _ViewModel({
    @required this.rootScreen,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      rootScreen: store.state.navState.rootScreen,
    );
  }
}